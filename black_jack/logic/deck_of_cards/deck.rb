# frozen_string_literal: false

require_relative 'card'

class Deck
  CARDS = {
    spades: [*"\u{1F0A1}".."\u{1F0AB}", *"\u{1F0AD}".."\u{1F0AE}"],
    hearts: [*"\u{1F0B1}".."\u{1F0BB}", *"\u{1F0BD}".."\u{1F0BE}"],
    diamonds: [*"\u{1F0C1}".."\u{1F0CB}", *"\u{1F0CD}".."\u{1F0CE}"],
    clubs: [*"\u{1F0D1}".."\u{1F0DB}", *"\u{1F0DD}".."\u{1F0DE}"]
  }.freeze

  attr_reader :cards

  def initialize
    @cards = []

    CARDS.each do |suit, cards|
      cards.each_with_index { |card, index| @cards << Card.new(card, suit, index + 1) }
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def next_card
    cards.pop
  end
end
