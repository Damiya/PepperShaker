class Api::V1::ChampionController < ApplicationController
  def show_by_name
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    champ = Champion.find_by_name(params[:name])
    render json: champ
  end

  def show_fights_by_name
    champ  = Champion.find_by_name(params[:name])
    render_fights(champ)
  end

  def show_wins_by_name
    champ  = Champion.find_by_name(params[:name])
    render_wins(champ)
  end

  def show_losses_by_name
    champ  = Champion.find_by_name(params[:name])
    render_losses(champ)
  end

  def show_by_id
    champ = Champion.find_by_id(params[:id])
    render json: champ
  end
  def show_fights_by_id
    champ  = Champion.find_by_id(params[:id])
    render_fights(champ)
  end

  def show_wins_by_id
    champ  = Champion.find_by_id(params[:id])
    render_wins(champ)
  end

  def show_losses_by_id
    champ  = Champion.find_by_id(params[:id])
    render_losses(champ)
  end

  def list_names
    names = Champion.select('id, name')
    render :json => { names: names }
  end

  private
  def render_fights(champ)
    fights = Fight.where('blue_champion_id = ? OR red_champion_id = ?', champ.id, champ.id)
    render :json => { fights: fights }
  end

  #TODO: Clean this code up
  def render_wins(champ)
    fights = Fight.where { (blue_champion_id==champ.id) & (winner==2) | (red_champion_id==champ.id) & (winner==1) }
    render :json => { fights: fights }
  end

  def render_losses(champ)
    fights = Fight.where { (blue_champion_id==champ.id) & (winner==1) | (red_champion_id==champ.id) & (winner==2) }
    render :json => { fights: fights }
  end
end
