class Dealer < Player
  def initialize(points_counting_rule)
    super('Dealer', points_counting_rule)
  end

  def should_hit?
    points < 17 && !full?
  end
end
