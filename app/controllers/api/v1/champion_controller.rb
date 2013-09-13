class Api::V1::ChampionController < ApplicationController
  respond_to :json
  def show
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    champ = Champion.find_by_name(params[:name])
    if champ
      render json: champ
    else
      head 404
    end
  end
end
