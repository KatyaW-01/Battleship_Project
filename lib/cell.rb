class Cell
    attr_reader :coordinate, :ship
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true
    end
    def empty?
        if @ship == nil
            @empty = true
        else
            @empty = false
        end
    end
    def place_ship(ship)
        @ship = ship 
    end
end