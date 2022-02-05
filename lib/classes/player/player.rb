# frozen_string_literal: false

class Player
  attr_reader :name, :cards, :bank

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
  end

  def bet(amount)
    @bank -= amount

    amount
  end

  def card(card)
    cards << card
  end

  def pass
    puts "#{name} passes"
  end

  def show_bank
    puts "#{name} $#{bank}"
  end

  def show_cards(face_up: false)
    puts "#{name} #{face_up ? open : closed}"
  end

  def show_points(&counting_rule)
    puts "#{name} has #{count_points(&counting_rule)} points"
  end

  private

  def open
    cards.map(&:face).join(' ')
  end

  def closed
    cards.map(&:back).join(' ')
  end

  def count_points(&counting_rule)
    cards.reduce(0, &counting_rule)
  end

  # def list_available_actions
  #   ACTIONS.each { |key, action| puts "#{key} - #{action}" }
  # end

  # def bet(bet)
  #   @bank -= bet

  #   bet
  # end

  # def get_card(card, face_up: false)
  #   cards << card

  #   puts "#{name} gets #{face_up ? card.value : card.back}"
  # end

  # def card(card)
  #   ACTIONS.delete :card

  #   get_card(card, face_up: true)
  # end

  # def pass(*_args)
  #   ACTIONS.delete :pass

  #   puts "#{name} passes"
  # end

  # def open(*_args)
  #   ACTIONS.delete :turn

  #   list_cards
  #   list_points
  # end

  # def list_cards
  #   cards.each { |card| puts card.value }
  # end

  # def list_points
  #   puts "#{name} has #{count_cards} points"
  # end

  # def count_cards
  #   cards.sum(&:points)
  # end
end
