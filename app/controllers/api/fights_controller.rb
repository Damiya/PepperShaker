class Api::FightsController < Api::BaseController
  resource_description do
    short 'SaltyBet fights and their outcomes.'
    formats ['json']
  end

  def_param_group :by_id do
    param :champ_one, Integer, 'Champion One id', :required => true, :desc => 'Represents a champion entry'
    param :champ_two, Integer, 'Champion Two id', :required => true, :desc => 'Represents a champion entry'
  end

  def_param_group :by_name do
    param :champ_one, /[^\/]+/, 'Champion One name', :required => true, :desc => 'Represents a champion entry'
    param :champ_two, /[^\/]+/, 'Champion Two name', :required => true, :desc => 'Represents a champion entry'
  end

  api :GET, '/fights/:id', 'Looks up a given fight by id'
  param :id, /\d+/, 'Fight id', :required => true, :desc => 'The id for a given fight'
  see 'champions#show_fights_by_id'
  see 'champions#show_wins_by_id'
  see 'champions#show_losses_by_id'
  example "{\"id\":1,\"blue_champion_id\":2,\"red_champion_id\":1,\"bets_red\":3752,\"bets_blue\":7079,\"bet_count\":44," +
              "\"winner\":2,\"created_at\":\"2013-09-19T03:50:04.703Z\",\"updated_at\":\"2013-09-19T03:50:04.703Z\",\"match_id\":4773}"
  def show
    fight = Fight.find_by_id(params[:id])

    if fight
      render json: fight
    else
      not_found_response
    end
  end

  api :GET, '/fights/by_name/:champ_one/:champ_two', 'Looks up both champions and provides their stats in a single object'
  description 'If the champions have fought each other before, includes a third subobject, -rematch-. See the second example'
  param_group :by_name
  example "{\"left\": [champion_one_object], \"right\": [champion_two_object]}"
  example "... ,\"rematch\":{\"left_has_won\":false,\"right_has_won\":true}}"
  def compare_by_name
    champ_one = Champion.find_by_name(params[:champ_one].downcase)
    champ_two = Champion.find_by_name(params[:champ_two].downcase)

    render_fight(champ_one, champ_two)
  end

  api :GET, '/fights/by_id/:champ_one/:champ_two', 'Looks up both champions and provides their stats in a single object'
  description 'If the champions have fought each other before, includes a third subobject, -rematch-. See the second example'
  param_group :by_id
  example "{\"left\": [champion_one_object], \"right\": [champion_two_object]}"
  example "... ,\"rematch\":{\"left_has_won\":false,\"right_has_won\":true}}"
  def compare_by_id
    champ_one = Champion.find_by_id(params[:champ_one])
    champ_two = Champion.find_by_id(params[:champ_two])

    render_fight(champ_one, champ_two)
  end

  api :GET, '/f/:champ_one/:champ_two', 'Redirect to the matchup on the FightMoney app (with comments and tags)'
  param_group :by_id
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
