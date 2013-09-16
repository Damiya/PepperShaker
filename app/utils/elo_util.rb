class EloUtil

  # @return [Float]
  def self.compute_score(rating1, rating2)
    1.0 / ( 1.0 + ( 10.0 ** ((rating1.to_f - rating2.to_f) / 400.0) ) )
  end

  # @param [Champion] champion
  def self.compute_k(champion)
    80 / [champion.total_matches,1].max
  end
end