class Interface
  def start
    puts 'Start game!'
    separate_block
  end

  def announce_winner(winner)
    puts "Winner is - #{winner.capitalize}!"
    separate_block
  end

  def announce_draw
    puts "it's a draw!"
    separate_block
  end

  def game_over
    puts 'Game is over!'
    separate_block
  end

  def next_step
    puts 'What next?'
    separate_block
  end

  def list_available_actions(actions)
    actions.each { |key, action| puts "#{key} - #{action}" }
    separate_block
  end

  def select_action
    action = gets.chomp.to_sym
    separate_block

    action
  end

  def player_gets_card(name)
    puts "#{name.capitalize} gets card"
    separate_block
  end

  def player_passes(name)
    puts "#{name.capitalize} passes"
    separate_block
  end

  def show_cards(name, cards, separate: false)
    puts "#{name.capitalize} #{cards}"
    separate_block if separate
  end

  def show_cards_points(name, cards, points, separate: false)
    puts "#{name.capitalize} #{cards}  - #{points} points"
    separate_block if separate
  end

  def show_bank(name, bank, separate: false)
    puts "#{name.capitalize} $#{bank}"
    separate_block if separate
  end

  def separate_block
    puts
  end
end
