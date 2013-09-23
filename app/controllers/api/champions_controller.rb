class Api::ChampionsController < Api::AuthController
  resource_description do
    short 'Lookup entries in the Champions table, representing the various characters that can be used in fights.'
    formats ['json']
    error 404, "Champion not found"
  end

  def_param_group :champion do
    param :id, /\d+/, 'Champion Id', :required => true, :desc => 'Represents a champion entry'
  end

  def index
    render json: Champion.all
  end

  api :GET, '/champions/:id', 'Output the full champion object'
  param_group :champion
  example " 'champion': "
  def show
    champ = Champion.find_by_id(params[:id])
    if champ
      champ
    else
      not_found_response
    end
  end

  api :GET, '/champions/:id/fights'
  param_group :champion

  def show_fights_by_id
    champ = Champion.find_by_id(params[:id])
    render_fights(champ)
  end


  api :GET, '/champions/:id/wins'
  param_group :champion

  def show_wins_by_id
    champ = Champion.find_by_id(params[:id])
    render_wins(champ)
  end

  api :GET, '/champions/:id/losses'
  param_group :champion

  def show_losses_by_id
    champ = Champion.find_by_id(params[:id])
    render_losses(champ)
  end

  api :GET, '/c/:id'
  param_group :champion

  def redirect_to_hightower
    champ = Champion.find_by_id(params[:id])
    redirect_to "http://fightmoney.herokuapp.com/stats/#/#{champ.name}/"
  end

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
