class Ship
    attr_reader :name, :length, :health
    def initialize(name,length)
        @name = name
        @length = length
        @health = length
        @sunk = false
    end

    
    def sunk?
        if @health == 0
            @sunk = true
        else
            false
        end
    end

    def hit
        @health -= 1
    end
end