# frozen_string_literal: false

class Player
  ACTIONS = {
    card: 'get a card',
    pass: 'pass',
    turn: 'turn over'
  }

  attr_reader :name, :cards, :money

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def bet(bet)
    @money -= bet

    bet
  end

  def get_card(card, face_down: false)
    cards << card

    face_down ? card.back : card.value
  end

  def card
    ACTIONS.delete :card
    get_card
  end

  def pass
    ACTIONS.delete :pass
    puts 'user passes'
  end

  def turn_over
    ACTIONS.delete :turn
    puts 'user cards shown'
  end

  def count_cards
    cards.sum(&:points)
  end
end
