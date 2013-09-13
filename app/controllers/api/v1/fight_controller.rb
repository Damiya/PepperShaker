class Api::V1::FightController < ApplicationController
  def show
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    fight = Fight.find_by_id(params[:id])
    if fight
      render json: fight
    else
      head 404
    end
  end
end
