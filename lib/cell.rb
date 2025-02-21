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
end