class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def index
    render 'application/index'
  end
end
