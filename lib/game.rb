class Game
    attr_reader :board
    def initialize
        @computer_board = Board.new
        @player_board = Board.new
    end

    def welcome_message
        "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    end

    def user_input_to_start_game
        user_input = gets.chomp
        
        if user_input == "p"
            computer_setup
        elsif user_input == "q"
            puts "Goodbye!"
        end
    end

    def player_setup
        explanation = "You have two ships, a Cruiser and Submarine.\nA Cruiser is three units long and the Submarine is two units long.\nYou need to place your ships."
        puts explanation
        puts @player_board.render
        puts "Enter the coordinates you would like to place your Cruiser (3 spaces):"
        user_cruiser_coordinates = gets.chomp
        
        cruiser = Ship.new("Cruiser", 3)
        valid_placement = @player_board.valid_placement?(cruiser,user_cruiser_coordinates.split(" "))
        #binding.pry
        while valid_placement == false
            puts "Invalid coordinates. Please try again."
            user_cruiser_coordinates = gets.chomp
            valid_placement = @player_board.valid_placement?(cruiser,user_cruiser_coordinates.split(" "))
        end
        
        @player_board.place(cruiser,user_cruiser_coordinates.split(" "))
        
        puts @player_board.render(true)

        puts "Enter the coordinates you would like to place your Submarine (2 spaces):"

        submarine = Ship.new("Submarine", 2)
        user_submarine_coordinates = gets.chomp

        valid_placement = @player_board.valid_placement?(submarine,user_submarine_coordinates.split(" "))

        while valid_placement == false
            puts "Invalid coordinates. Please try again."
            user_submarine_coordinates = gets.chomp
            valid_placement = @player_board.valid_placement?(submarine,user_submarine_coordinates.split(" "))
        end
        
        @player_board.place(submarine,user_submarine_coordinates.split(" "))
        
        puts @player_board.render(true)
        
    end

    def computer_setup
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        array_of_coordinates = @computer_board.cells.keys

        cruiser_coordinates = array_of_coordinates.sample(3)
        valid_placement = @computer_board.valid_placement?(cruiser,cruiser_coordinates)
        while valid_placement == false
            cruiser_coordinates = array_of_coordinates.sample(3)
            valid_placement = @computer_board.valid_placement?(cruiser,cruiser_coordinates)
        end
        @computer_board.place(cruiser,cruiser_coordinates)
        #puts @computer_board.render(true)
        
        submarine_coordinates = array_of_coordinates.sample(2)
        valid_placement = @computer_board.valid_placement?(submarine,submarine_coordinates)
        while valid_placement == false
            submarine_coordinates = array_of_coordinates.sample(2)
            valid_placement = @computer_board.valid_placement?(submarine,submarine_coordinates)
        end
        @computer_board.place(submarine,submarine_coordinates)
        #puts @computer_board.render(true)

        puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships."
        player_setup

    end

    def take_turns
        puts "=====COMPUTER BOARD====="
        puts @computer_board.render
        puts "=====PLAYER BOARD====="
        puts @player_board.render(true)
        puts "Enter a coordinate to fire upon:"
        user_coordinate = gets.chomp
        valid_coordinate = @computer_board.valid_coordinate?(user_coordinate)
        while valid_coordinate == false
            puts "Invalid coordinate. Please try again."
            user_coordinate = gets.chomp
            valid_coordinate = @computer_board.valid_coordinate?(user_coordinate)
        end
        @computer_board.cells[user_coordinate].fire_upon

        if @computer_board.cells[user_coordinate].empty? == true
            puts "Your shot on #{user_coordinate} was a miss."
        elsif @computer_board.cells[user_coordinate].empty? == false && @computer_board.cells[user_coordinate].ship.sunk? == false
            puts "Your shot on #{user_coordinate} was a hit."
        elsif @computer_board.cells[user_coordinate].empty? == false && @computer_board.cells[user_coordinate].ship.sunk? == true
            puts "Your shot on #{user_coordinate} sunk a ship!"
        end

        puts @computer_board.render
        #computers turn
        array_of_coordinates = @player_board.cells.keys
        computer_coordinate = array_of_coordinates.sample
        while @player_board.cells[computer_coordinate].fire_upon? == false
            computer_coordinate = array_of_coordinates.sample
        end
        @player_board.cells[computer_coordinate].fire_upon

        if @player_board.cells[computer_coordinate].empty? == true
            puts "My shot on #{computer_coordinate} was a miss."
        elsif @player_board.cells[computer_coordinate].empty? == false && @player_board.cells[computer_coordinate].ship.sunk? == false
            puts "My shot on #{computer_coordinate} was a hit."
        elsif @player_board.cells[computer_coordinate].empty? == false && @player_board.cells[computer_coordinate].ship.sunk? == true
            puts "My shot on #{computer_coordinate} sunk a ship!"
        end


        @player_board.render(true)


       
    end

    def end_game

    end
end

