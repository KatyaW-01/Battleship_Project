class Board
    attr_reader :cells
    def initialize 
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
           }
    end
    def valid_coordinate?(coordinate)
        @cells.keys.map.any? do |key|
            coordinate == key
       end
    end

    def valid_placement?(ship,coordinates)
        if ship.length == coordinates.length && 
            coordinates.map {|cell| cell.empty? == true} && 
            consecutive_coordinates(coordinates)
            true
        else
            false
        end
    end

    def consecutive_coordinates(coordinates)
        rows = []
        columns = []
        coordinates.each do |coordinate|
            rows << coordinate[0]
            columns << coordinate[1]

        end
        if rows.uniq.length == 1
            return_value = true
            columns.each_cons(2) do |current_column, next_column|
                if next_column.to_i - current_column.to_i != 1
                    return_value = false
                end
            end
            return_value

        elsif columns.uniq.length == 1
            return_value = true
            rows.each_cons(2) do |current_row, next_row|
                if next_row.ord - current_row.ord != 1
                    return_value = false
                end
            end
            return_value

        else
            false
        end
    end


    


end