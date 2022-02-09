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

  def points
    hand.count_points
  end

  def open
    hand.face_up
  end

  def closed
    hand.back_up
  end

  def empty_cards
    hand.empty
  end

  def full?
    hand.full?
  end
end
