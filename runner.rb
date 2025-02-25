require "./lib/board"
require "./lib/cell"
require './lib/ship'
require './lib/game'

battleship = Game.new

puts battleship.welcome_message
puts battleship.user_input_to_start_game
puts battleship.take_turns
puts battleship.end_game
puts battleship.welcome_message
puts battleship.user_input_to_start_game