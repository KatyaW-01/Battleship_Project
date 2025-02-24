class Game
    attr_reader :board
    def initialize
        @board = Board.new
    end

    def welcome_message
        "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    end

    def user_input_to_start_game
        user_input = gets.chomp
        
        if user_input == "p"
            player_setup
        elsif user_input == "q"
            puts "Goodbye!"
        end
    end

    def player_setup
        explanation = "You have two ships, a Cruiser and Submarine.\nA Cruiser is three units long and the Submarine is two units long.\nYou need to place your ships, please enter the ship and then the coordinates you want to place it on."
        puts explanation
        puts @board.render
        puts "Enter the ship you would like to place:"
        user_ship_placement = gets.chomp
        puts "Enter the coordinates you would like to place your #{user_ship_placement}:"
        user_ship_coordinates = gets.chomp
    end

    def computer_setup
        #place ships randomly
    end

    def take_turns

    end

    def end_game

    end
end

