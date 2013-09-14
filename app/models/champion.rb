class Champion < ActiveRecord::Base
  has_many :fights
  has_many :comments

  after_initialize :init

  private
  def init
    self.losses ||= 0
    self.wins ||= 0
    self.total_bets ||= 0
  end
end
