# frozen_string_literal: false

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }
actions = Actions.new

print 'What is your name? '
username = gets.chomp
puts "Welcome to Black Jack, #{username}!"

loop do
  puts

  puts "you get #{Deck::SPADES[5]} #{Deck::DIAMONDS[8]} - 15 points"
  puts "dealer gets #{Deck::HIDDEN_CARD} #{Deck::HIDDEN_CARD}"

  print "\nwhat do you wanna do:\n"
  actions.actions.each { |key, action| puts "#{key} - to #{action}" }
  actions.send gets.chomp.to_sym

  print "\nwhat do you wanna do:\n"
  actions.actions.each { |key, action| puts "#{key} - to #{action}" }
  actions.send gets.chomp.to_sym

  print "\nwhat do you wanna do:\n"
  actions.actions.each { |key, action| puts "#{key} - to #{action}" }
  actions.send gets.chomp.to_sym

  puts 'endgame'

  print "\nOne more game? Yes to play, anything else to leave - "
  answer = gets.chomp.to_sym

  if answer != :yes
    puts 'Good bye and come back!'
    break
  end

  puts 'New game!'
end
