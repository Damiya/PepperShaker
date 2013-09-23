class ApplicationController < ActionController::Base
  respond_to :xml, :json

  def index
    redirect_to apipie_apipie_path
  end
end
