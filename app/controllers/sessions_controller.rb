class SessionsController < Devise::SessionsController
  def create
    return missing_params unless (params[:email] && params[:password]) || (params[:remember_token])

    resource = if params[:remember_token]
                 resource_from_remember_token
               else
                 resource_from_credentials
               end
    return invalid_credentials unless resource

    resource.ensure_authentication_token
    data = {
        user_id:    resource.id,
        auth_token: resource.authentication_token,
    }

    if params[:remember]
      resource.remember_me!
      data[:remember_token] = remember_token(resource)
    end

    render json: data, status: 201
  end

  def destroy
    return missing_params unless params[:email] && params[:auth_token]

    resource = resource_from_auth_token
    return invalid_credentials unless resource

    resource.reset_tokens!
    render json: { user_id: resource.id }, status: 200
  end

  protected

  def missing_params
    warden.custom_failure!
    render json: {}, status: 400
  end

  def invalid_credentials
    warden.custom_failure!
    render json: {}, status: 401
  end

  def resource_from_credentials
    data = { email: params[:email] }
    res  = User.find_for_database_authentication(data)
    if res && res.valid_password?(params[:password])
      res
    end
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end

  # Major codesmell having this in btoh auth_controller and here, but I'm not sure how to handle the inheritance thing since this comes from devise.
  def resource_from_auth_token
    user_email = params[:email].presence
    user       = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      user
    end
  end

  def resource_from_remember_token
    token = params[:remember_token]
    id, identifier = token.split('#')
    resource_class.serialize_from_cookie(id, identifier)
  end

  def remember_token(resource)
    data = resource_class.serialize_into_cookie(resource)
    "#{data.first.first}##{data.last}"
  end
end