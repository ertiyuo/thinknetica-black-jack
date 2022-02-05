class Dealer < Player
  def initialize
    super('Dealer')
  end

  def choose_action(game)
    puts "#{name} is thinking"
    count_cards < 17 ? get_card(game.draw_card) : pass
  end
end
