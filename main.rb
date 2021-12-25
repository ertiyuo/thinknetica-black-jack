# frozen_string_literal: false

require_relative 'lib/game'

print 'What is your name? '
username = gets.chomp
puts "Welcome to Black Jack, #{username}!"
puts

loop do
  dealer = Dealer.new
  player = Player.new(username)
  game = Game.new(dealer, player)

  puts 'Players:'
  game.players.each { |pl| puts pl.name.to_s }
  puts 'Game on!'
  puts "BANK : #{game.bank}"
  puts

  puts 'You get: '
  2.times { puts player.get_card(game.draw_card) }
  puts 'Dealer gets: '
  2.times { puts dealer.get_card(game.draw_card, face_down: true) }
  puts

  bet = 10
  game.place_a_bet(player.bet(bet))
  game.place_a_bet(dealer.bet(bet))
  puts "Player : #{player.money}"
  puts "Dealer : #{dealer.money}"
  puts "BANK : #{game.bank}"
  puts

  puts "You have #{player.count_cards} points. What do you want to do next?"

  print "\nOne more game? Q/q to exit, anything else to play - "
  answer = gets.chomp.to_sym

  if %i[q Q].include?(answer)
    puts 'Good bye and come back!'
    break
  end

  puts 'New game!'
  puts
end
