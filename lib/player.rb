# frozen_string_literal: false

class Player
  ACTIONS = {
    card: 'get a card',
    pass: 'pass',
    open: 'open cards'
  }

  attr_reader :name, :cards, :money

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def list_available_actions
    ACTIONS.each { |key, action| puts "#{key} - #{action}" }
  end

  def bet(bet)
    @money -= bet

    bet
  end

  def get_card(card, face_up: false)
    cards << card

    puts "#{name} gets #{face_up ? card.value : card.back}"
  end

  def card(card)
    ACTIONS.delete :card

    get_card(card, face_up: true)
  end

  def pass(*_args)
    ACTIONS.delete :pass

    puts "#{name} passes"
  end

  def open(*_args)
    ACTIONS.delete :turn

    list_cards
    list_points
  end

  def list_cards
    cards.each { |card| puts card.value }
  end

  def list_points
    puts "#{name} has #{count_cards} points"
  end

  def count_cards
    cards.sum(&:points)
  end
end
