class Api::V1::FightController < ApplicationController
  def show
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    fight = Fight.find_by_id(params[:id])

    render json: fight
  end

  def compare
    champ_one = Champion.find_by_name(params[:champ_one])
    champ_two = Champion.find_by_name(params[:champ_two])

    render :json => { left: champ_one, right: champ_two }
  end
end
