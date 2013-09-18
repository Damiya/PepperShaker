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

  def redirect_to_hightower
    champ_one = Champion.find_by_id(params[:champ_one])
    champ_two = Champion.find_by_id(params[:champ_two])

    redirect_to "http://fightmoney.herokuapp.com/stats/#/#{champ_one.name}/#{champ_two.name}/"
  end

  private
  # @param [Champion] champ_one
  # @param [Champion] champ_two
  def render_fight(champ_one, champ_two)
    output = Jbuilder.encode do |json|
      json.left champ_one
      json.right champ_two

      if champ_one != nil && champ_two != nil
        rematch_check     = Fight.where({ blue_champion_id: champ_one.id, red_champion_id: champ_two.id })
        rematch_check_two = Fight.where({ blue_champion_id: champ_two.id, red_champion_id: champ_one.id })

        if rematch_check.any? || rematch_check_two.any?
          json.rematch do
            left_has_won, right_has_won = get_rematch_value(rematch_check, rematch_check_two, champ_one, champ_two)
            json.left_has_won left_has_won
            json.right_has_won right_has_won
          end
        end
      end
    end

    render json: output
  end

  #TODO: Make the ugly go away
  # @param [Fight] rematch_check
  # @param [Fight] rematch_check_two
  # @param [Champion] champ_one
  # @param [Champion] champ_two
  def get_rematch_value(rematch_check, rematch_check_two, champ_one, champ_two)
    one_has_won  = nil
    two_has_won  = nil

    rematch_check.each do |fight|
      one_has_won ||= fight.won_fight?(champ_one)
      two_has_won ||= fight.won_fight?(champ_two)
    end

    rematch_check_two.each do |fight|
      one_has_won ||= fight.won_fight?(champ_one)
      two_has_won ||= fight.won_fight?(champ_two)
    end

    return one_has_won, two_has_won
  end

end
