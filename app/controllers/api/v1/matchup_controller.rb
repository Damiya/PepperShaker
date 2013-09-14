class Api::V1::MatchupController < ApplicationController
  def compare
    champ_one = Champion.find_by_name(params[:champ_one])
    champ_two = Champion.find_by_name(params[:champ_two])

    render :json => { left: champ_one, right: champ_two }
  end
end
