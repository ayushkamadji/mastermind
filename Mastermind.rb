require_relative 'Game'

exit_command = false

until exit_command
print "\n====================="
print "\nWelcome to Mastermind"
print "\n====================="
print "\n\n1. New Game"
print "\n2. Exit"
print "\n\n Type in your selection"
print "\n\n"

selection = gets.strip.to_i

case selection
when 1
  g = Game.new
  g.start
when 2
  exit_command = true
end
end
