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

    @deck = Deck.new
  end

  def start
    show_banks
    shuffle_deck

    puts 'Start game!'
    puts

    gameplay
  end

  def gameplay
    first_deal
    show_cards

    place_bets
    show_banks

    show_points(player)
    player_next
  end

  def first_deal
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  def player_next
    puts 'What next?'
  end

  def place_bets
    take_bet(player)
    take_bet(dealer)
  end

  def show_banks
    player.show_bank
    dealer.show_bank
    show_bank
    puts
  end

  def show_cards
    player.show_cards(face_up: true)
    dealer.show_cards
    puts
  end

  def show_stats(player)
    player.show_bank
    player.show_cards(face_up: true)
    show_points(player)
  end

  def show_points(player)
    player.show_points(&POINTS_COUNTING)
  end

  def shuffle_deck
    puts 'Deck shuffling...'
    deck.shuffle
  end

  private

  def show_bank
    puts "Bank $#{bank}"
  end

  def deal_card(player)
    player.card(deck.next_card)
  end

  def take_bet(player)
    @bank += player.bet(BET_SIZE)
  end
end
