class Champion < ActiveRecord::Base
  has_many :fights
  has_many :comments

  after_initialize :init

  # @param [Champion] opponent
  def add_win(opponent)
    self.wins += 1
    change = EloUtil::compute_k(self) * (1 - EloUtil::compute_score(self.elo, opponent.elo))
    logger.info("#{self.name} GAIN #{change}")
    self.elo += change
  end

  # @param [Champion] opponent
  def add_loss(opponent)
    self.losses += 1
    change = EloUtil::compute_k(self) * (0 - EloUtil::compute_score(self.elo, opponent.elo))
    logger.info("#{self.name} LOSS #{change}")
    self.elo += change
  end

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