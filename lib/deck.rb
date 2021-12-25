# frozen_string_literal: false

require_relative 'card'

class Deck
  SPADES = [*"\u{1F0A1}".."\u{1F0AB}", *"\u{1F0AD}".."\u{1F0AE}"].to_a.freeze
  HEARTS = [*"\u{1F0B1}".."\u{1F0BB}", *"\u{1F0BD}".."\u{1F0BE}"].to_a.freeze
  DIAMONDS = [*"\u{1F0C1}".."\u{1F0CB}", *"\u{1F0CD}".."\u{1F0CE}"].to_a.freeze
  CLUBS = [*"\u{1F0D1}".."\u{1F0DB}", *"\u{1F0DD}".."\u{1F0DE}"].to_a.freeze

  attr_reader :cards

  def initialize
    @cards = []
    SPADES.zip(HEARTS, DIAMONDS, CLUBS).each_with_index do |cards, index|
      cards.each { |card| @cards << Card.new(card, index < 10 ? index + 1 : 10) }
    end

    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def next_card
    cards.pop
  end
end
