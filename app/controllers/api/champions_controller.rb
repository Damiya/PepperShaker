class Api::ChampionsController < Api::AuthController
  resource_description do
    short 'The various characters that can be used in fights.'
    formats ['json']
  end

  def_param_group :champion do
    param :id, Integer, 'Champion Id', :required => true, :desc => 'Represents a champion entry'
  end

  def index
    if_authenticated do
      render json: Champion.all
    end

  end

  api :GET, '/champions/:id', 'Output the full champion object'
  param_group :champion
  example " {\"id\":1,\"name\":\"gaara\",\"elo\":94,\"wins\":6,\"losses\":25,\"total_bets\":1385214,\"created_at\":" +
              "\"2013-09-19T03:50:04.592Z\",\"updated_at\":\"2013-09-21T07:00:02.834Z\"} "
  error 404, "Champion not found"

  def show
    champ = Champion.find_by_id(params[:id])
    if champ
      render json: champ
    else
      not_found_response
    end
  end

  api :GET, '/champions/:id/fights', 'Output all fights the champ has participated in'
  param_group :champion
  error 404, "Champion not found"
  see 'fights#show'

  def show_fights_by_id
    champ = Champion.find_by_id(params[:id])

    if champ
      render_fights(champ)
    else
      not_found_response
    end
  end


  api :GET, '/champions/:id/wins', 'Output all fights the champion has won'
  param_group :champion
  error 404, "Champion not found"
  see 'fights#show'

  def show_wins_by_id
    champ = Champion.find_by_id(params[:id])

    if champ
      render_wins(champ)
    else
      not_found_response
    end
  end

  api :GET, '/champions/:id/losses', 'Output all fights the champion has lost'
  param_group :champion
  error 404, "Champion not found"
  see 'fights#show'

  def show_losses_by_id
    champ = Champion.find_by_id(params[:id])

    if champ
      render_losses(champ)
    else
      not_found_response
    end
  end

  api :GET, '/c/:id', 'Redirect to the champion on the FightMoney app (with comments and tags)'
  param_group :champion
  error 404, "Champion not found"


  def redirect_to_hightower
    champ = Champion.find_by_id(params[:id])
    if champ
      redirect_to "http://fightmoney.herokuapp.com/stats/#/#{champ.name}/"
    else
      not_found_response
    end

  end

  api :GET, '/champions/list', 'Returns a JSON dictionary where the keys are champion names and the ids are champion ids'
  example "{\"mega and.18\":74,\"tron bonne\":2,\"orchid\":13,\"vega\":32,\"medoi-san\":10,\"kamiccolo\":70,\"cyclops\":52,\"parasite\":11, ...}"

  def list_champions
    champions = Champion.select('id, name')

    output = Jbuilder.encode do |json|
      champions.each do |champion|
        json.set! champion.name, champion.id
      end
    end
    render json: output
  end

  private
  # @param [Champion] champ
  def render_fights(champ)
    fights = Fight.where('blue_champion_id = ? OR red_champion_id = ?', champ.id, champ.id)
    render :json => { fights: fights }
  end

  #TODO: Clean this code up

  # @param [Champion] champ
  def render_wins(champ)
    fights = Fight.where { (blue_champion_id==champ.id) & (winner==2) | (red_champion_id==champ.id) & (winner==1) }
    render :json => { fights: fights }
  end

  # @param [Champion] champ
  def render_losses(champ)
    fights = Fight.where { (blue_champion_id==champ.id) & (winner==1) | (red_champion_id==champ.id) & (winner==2) }
    render :json => { fights: fights }
  end
end
