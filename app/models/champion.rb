class Champion < ActiveRecord::Base
  has_and_belongs_to_many :fights

  def win_rate
    losses/wins
  end
end
