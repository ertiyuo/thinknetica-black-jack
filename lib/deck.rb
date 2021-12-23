# frozen_string_literal: false

class Deck
  BACK = "\u{1F0A0}".freeze
  SPADES = [*"\u{1F0A1}".."\u{1F0AB}", *"\u{1F0AD}".."\u{1F0AE}"].to_a.freeze
  HEARTS = [*"\u{1F0B1}".."\u{1F0BB}", *"\u{1F0BD}".."\u{1F0BE}"].to_a.freeze
  DIAMONDS = [*"\u{1F0C1}".."\u{1F0CB}", *"\u{1F0CD}".."\u{1F0CE}"].to_a.freeze
  CLUBS = [*"\u{1F0D1}".."\u{1F0DB}", *"\u{1F0DD}".."\u{1F0DE}"].to_a.freeze

  attr_reader :cards

  def initialize
    @cards = (SPADES + HEARTS + DIAMONDS + CLUBS).shuffle
  end

  def shuffle
    @cards.shuffle
  end

  def next_card
    cards.pop
  end

  def back
    BACK
  end

  def card_value(card)
    card.ord
  end
end
