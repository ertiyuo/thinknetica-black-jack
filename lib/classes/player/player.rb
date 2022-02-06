# frozen_string_literal: false

class Player
  attr_reader :name, :cards, :bank

  def initialize(name, points_counting_rule)
    @name = name
    @bank = 100
    @cards = []

    @points_counting_rule = points_counting_rule
  end

  def bet(amount)
    @bank -= amount

    amount
  end

  def receive(amount)
    @bank += amount
  end

  def card(card)
    cards << card
  end

  def empty_cards
    @cards = []
  end

  def pass
    puts "#{name} passes"
  end

  def points
    count_points
  end

  def show_bank
    puts "#{name} $#{bank}"
  end

  def show_cards(face_up: false)
    puts(face_up ? "#{name} #{cards_face_up} - #{points} points" : "#{name} #{cards_back_up}")
  end

  def show_points
    puts "#{name} has #{count_points} points"
  end

  private

  def cards_face_up
    cards.map(&:face).join(' ')
  end

  def cards_back_up
    cards.map(&:back).join(' ')
  end

  def count_points
    cards.reduce(0, &@points_counting_rule)
  end
end
