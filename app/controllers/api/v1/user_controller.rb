class Api::V1::UserController < Api::AuthController
  before_action

  def show
    unless is_authenticated? and current_user.id==params[:id].to_i
      render json: {}, status: 401
      return
    end

    output = Jbuilder.encode do |json|
      json.username current_user.username
      json.email current_user.email
      json.admin current_user.admin
    end

    render :json => output
  end
end
