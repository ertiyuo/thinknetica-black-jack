require_relative 'deck/deck'
require_relative 'player/player'
require_relative 'player/dealer'

class Game
  POINTS_COUNTING = lambda do |sum, card|
    if card.number > 10
      sum + 10
    elsif card.number > 1
      sum + card.number
    else
      sum + (sum > 10 ? 1 : 11)
    end
  end

  ACTIONS = {
    card: 'hit a card',
    pass: 'pass',
    open: 'open up'
  }

  BET_SIZE = 10

  attr_reader :deck, :bank, :player, :dealer

  def initialize(player_name)
    @bank = 0

    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new.shuffle
  end

  def start
    show_players
    puts 'Start game!'
    puts

    deal_cards
  end

  def deal_cards
    puts 'Player gets: 1 2'
    puts 'Dealer gets: * * '

    place_bets
  end

  def place_bets
    @bank += player.bet(BET_SIZE)
    @bank += dealer.bet(BET_SIZE)
    show_players

    player_next
  end

  def player_next
    show_points(player)
    puts 'What next?'
  end

  def show_players
    puts "#{player.name} $#{player.bank}"
    puts "#{dealer.name} $#{dealer.bank}"
  end

  def show_points(player)
    player.show_points(&POINTS_COUNTING)
  end
end
