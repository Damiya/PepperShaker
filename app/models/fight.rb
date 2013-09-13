class Fight < ActiveRecord::Base
  belongs_to :blue_champion, class_name: 'Champion'
  belongs_to :red_champion, class_name: 'Champion'

  def update_champions
    unless self.champions_updated
      red_champion.total_bets  += bets_red
      blue_champion.total_bets += bets_blue

      if winner == 1
        red_champion.wins    += 1
        blue_champion.losses += 1
      else
        red_champion.losses += 1
        blue_champion.wins  += 1
      end

      self.champions_updated=true
      save
      red_champion.save
      blue_champion.save
    end

  end
end
