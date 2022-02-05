class Card
  BACK = "\u{1F0A0}".freeze

  attr_reader :card, :suit, :number

  def initialize(card, suit, number)
    @card = card
    @suit = suit
    @number = number
  end

  def back
    BACK
  end
end
