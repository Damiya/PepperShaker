class Api::V1::FightController < ApplicationController
  def show
    # Supposedly Rails sanitizes 'find_by_blah'? Consider me skeptical
    fight = Fight.find_by_id(params[:id])

    render json: fight
  end

  def compare_by_name
    champ_one = Champion.find_by_name(params[:champ_one].downcase)
    champ_two = Champion.find_by_name(params[:champ_two].downcase)

    render_fight(champ_one, champ_two)
  end

  def compare_by_id
    champ_one = Champion.find_by_id(params[:champ_one])
    champ_two = Champion.find_by_id(params[:champ_two])
    render_fight(champ_one, champ_two)
  end

  private
  def render_fight(champ_one,champ_two)
    rematch_check = Fight.where(:blue_champion_id => champ_one.id, :red_champion_id => champ_two.id )
    rematch_check_two = Fight.where(:red_champion_id => champ_one.id, :blue_champion_id => champ_two.id)
    if rematch_check || rematch_check_two
      print("hello world")
    end
    render :json => { left: champ_one, right: champ_two }
  end
end
