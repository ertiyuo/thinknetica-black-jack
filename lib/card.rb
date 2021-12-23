class Card
  BACK = "\u{1F0A0}".freeze

  def initialize(card)
    @value = card
  end

  def value
    @value.ord
  end

  def front
    @value
  end

  def back
    BACK
  end
end
