module Api
  class BaseController < ApplicationController
    respond_to :json
    before_filter :default_json

    def collection
      get_collection_ivar || begin
        c = end_of_association_chain
        coll = c.respond_to?(:scoped) ? c.scoped : c
        coll = params[:ids] ? coll.find(params[:ids]) : coll.all
        set_collection_ivar(coll)
      end
    end

    protected

    def not_found_response
      render json: {}, status: 404
    end

    def default_json
      request.format = :json if params[:format].nil?
    end
  end
end