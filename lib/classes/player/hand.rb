# frozen_string_literal: false

class Hand
  attr_reader :cards

  def initialize(points_counting_rule)
    @cards = []
    @points_counting_rule = points_counting_rule
  end

  def add(card)
    cards << card
  end

  def empty
    @cards = []
  end

  def face_up
    cards.map(&:face).join(' ')
  end

  def back_up
    cards.map(&:back).join(' ')
  end

  def count_points
    cards.reduce(0, &@points_counting_rule)
  end

  def full?
    cards.length == 3
  end
end
