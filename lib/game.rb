class Game
    def initialize
        @computer_board = Board.new
        @player_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
    end

    def welcome_message
        "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    end

    def user_input_to_start_game
        user_input = gets.chomp
        
        if user_input == "p"
            computer_setup
            player_setup
        elsif user_input == "q"
            puts "Goodbye!"
            exit
        end
    end

    def computer_setup
        array_of_coordinates = @computer_board.cells.keys

        cruiser_coordinates = array_of_coordinates.sample(3)
        valid_placement = @computer_board.valid_placement?(@computer_cruiser,cruiser_coordinates)
        while valid_placement == false
            cruiser_coordinates = array_of_coordinates.sample(3)
            valid_placement = @computer_board.valid_placement?(@computer_cruiser,cruiser_coordinates)
        end
        @computer_board.place(@computer_cruiser,cruiser_coordinates)
        #puts @computer_board.render(true)
        
        submarine_coordinates = array_of_coordinates.sample(2)
        valid_placement = @computer_board.valid_placement?(@computer_submarine,submarine_coordinates)
        while valid_placement == false
            submarine_coordinates = array_of_coordinates.sample(2)
            valid_placement = @computer_board.valid_placement?(@computer_submarine,submarine_coordinates)
        end
        @computer_board.place(@computer_submarine,submarine_coordinates)
        #puts @computer_board.render(true)

        puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships."

    end

    def player_setup
        explanation = "The Cruiser is three units long and the Submarine is two units long."
        puts explanation
        puts @player_board.render
        #place cruiser
        puts "Enter the coordinates you would like to place your Cruiser (3 spaces):"
        user_cruiser_coordinates = gets.chomp
        #first check if coordinates are valid
        coordinates_array = user_cruiser_coordinates.split(" ")
        while @player_board.valid_coordinate?(coordinates_array[0]) == false || @player_board.valid_coordinate?(coordinates_array[1]) == false || @player_board.valid_coordinate?(coordinates_array[2]) == false
            puts "Invalid coordinates. Please try again."
            user_cruiser_coordinates = gets.chomp
            coordinates_array = user_cruiser_coordinates.split(" ")
        end
        #if coordinates are valid, check if placement is valid
        valid_placement = @player_board.valid_placement?(@player_cruiser,user_cruiser_coordinates.split(" "))
    
        while valid_placement == false
            puts "Invalid coordinates. Please try again."
            user_cruiser_coordinates = gets.chomp
            valid_placement = @player_board.valid_placement?(@player_cruiser,user_cruiser_coordinates.split(" "))
        end
       
       #if both coordinates and placement are valid, place the cruiser 
        @player_board.place(@player_cruiser,user_cruiser_coordinates.split(" "))
        
        puts @player_board.render(true)

        puts "Enter the coordinates you would like to place your Submarine (2 spaces):"
        #place submarine
        user_submarine_coordinates = gets.chomp
        sub_coordinates_array = user_submarine_coordinates.split(" ")
        #first check if coordinates are valid
        while @player_board.valid_coordinate?(sub_coordinates_array[0]) == false || @player_board.valid_coordinate?(sub_coordinates_array[1]) == false 
            puts "Invalid coordinates. Please try again."
            user_submarine_coordinates = gets.chomp
            sub_coordinates_array = user_submarine_coordinates.split(" ")
        end
        #if coordinates are valid, check if placement is valid
        valid_placement = @player_board.valid_placement?(@player_submarine,user_submarine_coordinates.split(" "))

        while valid_placement == false
            puts "Invalid coordinates. Please try again."
            user_submarine_coordinates = gets.chomp
            valid_placement = @player_board.valid_placement?(@player_submarine,user_submarine_coordinates.split(" "))
        end
        #if both coordinates and placement are valid, place the submarine 
        @player_board.place(@player_submarine,user_submarine_coordinates.split(" "))
        
        #display player's board with both cruiser and submarine placement
        puts @player_board.render(true)
        
    end


    def take_turns
        until (@computer_cruiser.sunk? == true && @computer_submarine.sunk? == true) || (@player_cruiser.sunk? == true && @player_submarine.sunk? == true)

            #player's turn
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

            while @computer_board.cells[user_coordinate].fire_upon? == true
                puts "You have already fired on this coordinate. Please choose another one."
                user_coordinate = gets.chomp
                valid_coordinate = @computer_board.valid_coordinate?(user_coordinate)
                while valid_coordinate == false
                    puts "Invalid coordinate. Please try again."
                    user_coordinate = gets.chomp
                    valid_coordinate = @computer_board.valid_coordinate?(user_coordinate)
                end
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
            if @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
                break
            end

            #computer's turn
            array_of_coordinates = @player_board.cells.keys
            computer_coordinate = array_of_coordinates.sample
            while @player_board.cells[computer_coordinate].fire_upon? == true
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

            if @player_cruiser.sunk? == true && @player_submarine.sunk? == true
                break
            end
        end  
    end



    def end_game
        if @player_cruiser.sunk? == true && @player_submarine.sunk? == true
            puts "I won!"
        else
            puts "You won!"
        end

    end
end

