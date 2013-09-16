class EloUtil

  def self.compute_score(self_rating, opponent_rating)
    1.0 / ( 1.0 + ( 10.0 ** ((opponent_rating - self_rating) / 400) ) )
  end

  # @param [Champion] champion
  def self.compute_k(champion)
    k=0

    if champion.total_matches <= 10
      k = 100
    end
    if champion.total_matches <= 30 && champion.total_matches > 10
      k = 50
    end
    if champion.total_matches > 30
      k = 15
    end

    k
  end
end