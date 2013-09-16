class Fight < ActiveRecord::Base
  belongs_to :blue_champion, class_name: 'Champion'
  belongs_to :red_champion, class_name: 'Champion'

  def update_champions
    red_champion.total_bets  += bets_red
    blue_champion.total_bets += bets_blue

    red_change  = EloUtil::compute_score(red_champion.elo, blue_champion.elo)
    blue_change = EloUtil::compute_score(blue_champion.elo, red_champion.elo)
    red_k       = EloUtil::compute_k(red_champion)
    blue_k      = EloUtil::compute_k(blue_champion)

    if winner == 1
      red_champion.wins    += 1
      blue_champion.losses += 1
      red_champion.elo     += red_k * (1-red_change)
      blue_champion.elo    += blue_k * (0-blue_change)
    else
      red_champion.losses += 1
      blue_champion.wins  += 1
      red_champion.elo    += red_k * (0-red_change)
      blue_champion.elo   += blue_k * (1-blue_change)
    end

    red_champion.save
    blue_champion.save
  end

end

