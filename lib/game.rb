require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  attr_reader :deck, :bank, :players

  def initialize(*players)
    @deck = Deck.new
    @bank = 0
    @players = players
  end

  def place_a_bet(bet)
    @bank += bet
  end

  def give_card(player, face_down: false)
    card = deck.next_card
    player.get_card(card)

    puts "player #{player.name} gets #{face_down ? deck.back : card}"
  end
end
