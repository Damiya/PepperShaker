class Champion < ActiveRecord::Base
  has_many :fights
  has_many :comments

  after_initialize :init

  def total_matches
    self.wins + self.losses
  end

  private
  def init
    begin
      self.elo        ||= 0
      self.losses     ||= 0
      self.wins       ||= 0
      self.total_bets ||= 0
    rescue => error
      # ignored
    end

  end
end