class Card
  BACK = "\u{1F0A0}".freeze

  attr_reader :face, :suit, :number

  def initialize(face, suit, number)
    @face = face
    @suit = suit
    @number = number
  end

  def back
    BACK
  end
end
