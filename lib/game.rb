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
        puts "Enter the coordinates you would like to place your Cruiser (3 spaces):"
        user_cruiser_coordinates = gets.chomp
        
        cruiser = Ship.new("Cruiser",3)
        valid_placement = @board.valid_placement?(cruiser,user_cruiser_coordinates.split(" "))
        #binding.pry
        if valid_placement == false
            puts "Invalid coordinates. Please try again."
        else
            @board.place(cruiser,user_cruiser_coordinates.split(" "))
        end
        puts @board.render(true)

        puts
        
    end

    def computer_setup
        #place ships randomly
    end

    def take_turns

    end

    def end_game

    end
end

