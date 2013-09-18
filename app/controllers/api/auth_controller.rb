module Api
  class AuthController < BaseController

    before_filter :authenticate_user_from_token!

    before_filter :authenticate_user!

    protected

    def auth_only!
      unless params[:auth_token] && user_signed_in?
        render json: {}, status: 401
      end
    end

    def validate_token!
      compare_token
    end

    def authenticate_user_from_token!
      if compare_token
        sign_in user, store: false
      end
    end

    private

    def compare_token
      user_email = params[:email].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
        true
      end

      false
    end

  end
end