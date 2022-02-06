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

    @player = Player.new(player_name, POINTS_COUNTING)
    @dealer = Dealer.new(POINTS_COUNTING)

    @deck = Deck.new

    @available_actions = ACTIONS
  end

  def start
    make_preparations
    show_banks

    puts 'Start game!'
    puts

    gameplay
  rescue GameOver
    puts 'Game is over!'
  end

  def gameplay
    first_deal
    place_bets

    turn_to_player
    turn_to_dealer

    open if dealer.cards.length == 3 && player.cards.length == 3

    turn_to_player
    turn_to_dealer

    open
  end

  def first_deal
    2.times do
      deal_card(player)
      deal_card(dealer)
    end

    show_cards
  end

  def place_bets
    take_bet(player)
    take_bet(dealer)

    show_banks
  end

  def turn_to_player
    puts 'What next?'
    puts

    show_available_actions
    send(choose_action)
  end

  def turn_to_dealer
    if dealer.points < 17 && dealer.cards.length < 3
      puts "#{dealer.name} gets card"
      deal_card(dealer)
    else
      dealer.pass
    end

    puts
  end

  def show_available_actions
    @available_actions.each { |key, action| puts "#{key} - #{action}" }
    puts
  end

  def choose_action
    action = gets.chomp.to_sym
    @available_actions.delete action
    puts

    action
  end

  def deal_card(player)
    player.card(deck.next_card)
  end

  def take_bet(player)
    @bank += player.bet(BET_SIZE)
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

  private

  def card
    deal_card(player)
    player.show_cards(face_up: true)
    puts
  end

  def pass
    player.pass
    puts
  end

  def open
    player.show_cards(face_up: true)
    dealer.show_cards(face_up: true)

    puts 'Winner is - '

    raise GameOver
  end

  def show_bank
    puts "Bank $#{bank}"
  end

  def make_preparations
    init_actions
    empty_players_cards
    shuffle_deck
  end

  def empty_players_cards
    player.empty_cards
    dealer.empty_cards
  end

  def init_actions
    @available_actions = ACTIONS.clone
  end

  def shuffle_deck
    deck.shuffle
  end
end

class GameOver < StandardError
end
