require_relative 'interface/interface'
require_relative 'logic/deck_of_cards/deck'
require_relative 'logic/player/player'
require_relative 'logic/dealer/dealer'

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

  attr_reader :interface, :deck, :bank, :player, :dealer

  def initialize(player_name)
    @bank = 0

    @interface = Interface.new

    @deck = Deck.new

    @player = Player.new(player_name, POINTS_COUNTING)
    @dealer = Dealer.new(POINTS_COUNTING)

    @available_actions = ACTIONS
  end

  def start
    make_preparations
    stats

    interface.start

    gameplay
  rescue GameOver
    stats

    interface.game_over
  end

  def gameplay
    first_deal
    place_bets

    turn_to_player
    turn_to_dealer

    open if dealer.full? && player.full?

    turn_to_player
    turn_to_dealer

    open
  end

  def first_deal
    2.times do
      deal_card(player)
      deal_card(dealer)
    end

    interface.show_cards_points(player.name, player.open, player.points)
    interface.show_cards(dealer.name, dealer.closed, separate: true)
  end

  def place_bets
    take_bet(player)
    take_bet(dealer)

    stats
  end

  def turn_to_player
    interface.next_step
    interface.list_available_actions(@available_actions)
    action = interface.select_action

    @available_actions.delete action
    send(action)
  end

  def turn_to_dealer
    if dealer.should_hit?
      interface.player_gets_card(dealer.name)
      deal_card(dealer)
    else
      interface.player_passes(dealer.name)
    end
  end

  def deal_card(player)
    player.card(deck.next_card)
  end

  def take_bet(player)
    @bank += player.bet(BET_SIZE)
  end

  private

  def card
    deal_card(player)
    interface.show_cards_points(player.name, player.open, player.points, separate: true)
  end

  def pass
    interface.player_passes(player.name)
  end

  def open
    interface.show_cards_points(player.name, player.open, player.points)
    interface.show_cards_points(dealer.name, dealer.open, dealer.points, separate: true)

    finish
  rescue Draw
    finish_draw
  ensure
    raise GameOver
  end

  def finish
    winner = find_winner
    interface.announce_winner(winner.name)
    pay_winner(winner)
  end

  def finish_draw
    interface.announce_draw
    split_gain
  end

  def split_gain
    sum = bank / 2
    player.win(sum)
    dealer.win(sum)

    @bank = 0
  end

  def pay_winner(player)
    player.win(bank)
    @bank = 0
  end

  def find_winner
    raise Draw if dealer.points == player.points

    return dealer if player.points > 21
    return player if dealer.points > 21

    (21 - player.points) < (21 - dealer.points) ? player : dealer
  end

  def stats
    interface.show_bank(player.name, player.bank)
    interface.show_bank(dealer.name, dealer.bank)
    interface.show_bank('bank', bank, separate: true)
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

class Draw < StandardError
end
