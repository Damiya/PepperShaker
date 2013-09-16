class EloUtil

  # @return [Float]
  def self.compute_score(rating1, rating2)
    1.0 / ( 1.0 + ( 10.0 ** ((rating1.to_f - rating2.to_f) / 400.0) ) )
  end

  # @param [Champion] champion
  def self.compute_k(champion)
    k=0

    if champion.total_matches <= 5
      k = 20
    end
    if champion.total_matches <= 10 && champion.total_matches > 5
      k = 10
    end
    if champion.total_matches > 10
      k = 5
    end

    k
  end
end