# frozen_string_literal: false

require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank

  def initialize(name, points_counting_rule)
    @name = name
    @bank = 100
    @hand = Hand.new(points_counting_rule)
  end

  def bet(amount)
    @bank -= amount

    amount
  end

  def win(amount)
    @bank += amount
  end

  def card(card)
    hand.add(card)
  end

  def pass
    puts "#{name} passes"
  end

  def points
    hand.count_points
  end

  def show_bank
    puts "#{name} $#{bank}"
  end

  def show_cards(face_up: false)
    puts(face_up ? "#{name} #{hand.face_up} - #{points} points" : "#{name} #{hand.back_up}")
  end

  def show_points
    puts "#{name} has #{points} points"
  end

  def empty_cards
    hand.empty
  end

  def full?
    hand.full?
  end
end
