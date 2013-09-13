class Api::V1::ChampionController < ApplicationController
  def show
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    champ = Champion.find_by_name(params[:name])
    if champ
      render json: champ
    else
      head 404
    end
  end

  def show_fights
    champ = Champion.find_by_name(params[:name])
    if champ
      fights = Fight.where('blue_champion_id = ? OR red_champion_id = ?', champ.id, champ.id)
      if fights
        render :json => {fights: fights}
      else
        head 404
      end
    else
      head 404
    end
  end

  ## THIS IS THE UGLIEST BUT IM TIRED FUCK IT
  def show_wins
    champ = Champion.find_by_name(params[:name])
    if champ
      fights = Fight.where{(blue_champion_id==champ.id) & (winner==2) | (red_champion_id==champ.id) & (winner==1)}
      if fights
        render :json => {fights: fights}
      else
        head 404
      end
    else
      head 404
    end
  end

  def show_losses
    champ = Champion.find_by_name(params[:name])
    if champ
      fights = Fight.where{(blue_champion_id==champ.id) & (winner==1) | (red_champion_id==champ.id) & (winner==2)}
      if fights
        render :json => {fights: fights}
      else
        head 404
      end
    else
      head 404
    end
  end
end
