class Champion < ActiveRecord::Base
  has_many :fights
  has_many :comments

  after_initialize :init

  private
  def init
    begin
      self.losses ||= 0
      self.wins ||= 0
      self.total_bets ||= 0
    rescue ActiveRecord::MissingAttributeError
      # ignored
    end

  end
end