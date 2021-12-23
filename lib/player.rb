# frozen_string_literal: false

class Player
  attr_reader :cards

  def initialize(initial_cards)
    @cards = initial_cards
  end

  def get_card(card)
    cards << card
  end

  def pass
    puts 'user passes'
  end

  def turn_over
    puts 'user cards shown'
  end

  def count
    puts 'cards count'
  end
end
