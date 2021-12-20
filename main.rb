# frozen_string_literal: false

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

print 'What is your name? '
username = gets.chomp
puts "Welcome to Black Jack, #{username}!"

loop do
  puts

  puts 'user gets 2 cards'
  puts 'dealer gets 2 cards'

  puts 'game on'
  puts 'endgame'

  print "\nOne more game? Yes to play, anything else to leave - "
  answer = gets.chomp.to_sym

  if answer != :yes
    puts 'Good bye and come back!'
    break
  end

  puts 'New game!'
end
