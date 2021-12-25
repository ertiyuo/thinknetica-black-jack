class Card
  BACK = "\u{1F0A0}".freeze

  attr_reader :value, :points

  def initialize(value, points)
    @value = value
    @points = points
  end

  def back
    BACK
  end
end
