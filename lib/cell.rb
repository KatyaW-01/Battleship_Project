require 'pry'
class Cell
    attr_reader :coordinate, :ship
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fire = false
    end

    def empty?
        if @ship == nil
            true
        else
            false
        end
    end

    def place_ship(ship)
        @ship = ship 
    end

   
    def fire_upon?
        @fire   
    end

    def fire_upon
        if  empty? == false
            
            @ship.hit
        end
        @fire = true

    end

    def render(show_ship = false)
        if show_ship == true
            "S"
        elsif @fire == false
            "."
        elsif @fire == true && empty? == true
            "M"
        elsif @fire == true && @ship.sunk? == true
            "X"
        elsif @fire == true && empty? == false
            "H"
        
        end
    end
end