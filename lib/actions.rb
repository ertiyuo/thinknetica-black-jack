# frozen_string_literal: false

class Actions
  ACTIONS = {
    card: 'get a card',
    pass: 'pass',
    turn: 'turn over'
  }

  def actions
    ACTIONS
  end

  def card
    puts "you get #{Cards::HEARTS[11]} - 25 points"
    ACTIONS.delete :card
  end

  def pass
    puts 'you pass'
    ACTIONS.delete :pass
  end

  def turn
    puts "you have #{Cards::SPADES[5]} #{Cards::DIAMONDS[8]} #{Cards::HEARTS[11]} - 25 points"
    puts "dealer has #{Cards::CLUBS[1]} #{Cards::DIAMONDS[8]} #{Cards::HEARTS[11]} - 21 points"
    ACTIONS.delete :turn
  end
end
