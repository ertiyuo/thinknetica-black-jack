require_relative 'lib/classes/game'

print 'Hello, what is your name? '
username = gets.chomp
puts "Welcome to Black Jack, #{username}!"
puts

game = Game.new(username)

loop do
  game.start

  print "\nOne more game? Q/q to exit, anything else to play - "
  answer = gets.chomp.to_sym

  if %i[q Q].include?(answer)
    print "Good bye and come back!\n"
    break
  end

  puts 'New game!'
  puts
end
