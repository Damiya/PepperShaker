module Api
  class AuthController < BaseController

    before_filter :authenticate_user_from_token!

    protected

    def auth_only!
      unless params[:auth_token] && user_signed_in?
        render json: {}, status: 401
      end
    end

    def validate_token!
      false unless resource_from_auth_token
    end

    def authenticate_user_from_token!
      user = resource_from_auth_token
      if user
        # We bypass to avoid the callback chain which inappropriately inflates our signin numbers
        sign_in user, store: false, bypass: true
      end
    end

    private

    def resource_from_auth_token
      return unless params[:auth_token]
      id, token = params[:auth_token].split('$')
      user = User.find_by_id(id)

      if user && Devise.secure_compare(user.authentication_token, token)
        user
      end
    end

  end
end