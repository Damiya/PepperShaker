class Api::V1::ErrataController < ApplicationController
  def stats
    num_fights           = Fight.count
    num_champions        = Champion.count
    all_champs           = Champion.all
    most_total_bet_champ = all_champs.order(total_bets: :desc).first
    most_wins_champ      = all_champs.order(wins: :desc).first
    most_losses_champ    = all_champs.order(losses: :desc).first

    render :json => { num_fights:     num_fights, num_champions: num_champions,
                      most_total_bet: { name: most_total_bet_champ.name, amount: most_total_bet_champ.total_bets },
                      most_wins:      { name: most_wins_champ.name, amount: most_wins_champ.wins },
                      most_losses:    { name: most_losses_champ.name, amount: most_losses_champ.losses }
    }
  end
end
