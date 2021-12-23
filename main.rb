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

  2.times { game.give_card(player) }
  2.times { game.give_card(dealer, face_down: true) }

  puts "Player #{player.name} has #{player.count_cards} points"

  print "\nOne more game? Yes to play, anything else to leave - "
  answer = gets.chomp.to_sym

  if answer != :yes
    puts 'Good bye and come back!'
    break
  end

  puts 'New game!'
  puts
end
