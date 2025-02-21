require './lib/ship'
require './lib/cell'
require "pry"

RSpec.describe Cell do
    before :each  do
        @cell = Cell.new("B4")
    end
    describe "attribute of cell" do
        it "exist" do
            expect(@cell).to be_a(Cell)
        end
        it "has a coordinate" do
            expect(@cell.coordinate).to eq("B4")
        end
    end
    describe "checks if ship is on this cell" do
        it "returns nil" do
            expect(@cell.ship).to eq(nil)
        end
    end
    describe "checks if the cell is empty" do
        it "it returns true/false based on if the cell is empty" do
            expect(@cell.empty?).to be(true)
        end
    end
    describe "place ship" do
        it "can place a ship" do
            cruiser = Ship.new("Cruiser", 3)
            
            expect(@cell.empty?).to be(true)

            @cell.place_ship(cruiser)

            expect(@cell.ship).to eq(cruiser)
            expect(@cell.empty?).to be(false)
        end
    end


    describe "render" do
        it 'can return a string representation of the cell' do
            cell_1 = Cell.new("B4")

            cell_1.render

            expect(cell_1.render).to eq(".")

            cell_1.fire_upon

            expect(cell1.render).to eq("M")

            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)

            cell_2.place_ship(cruiser)

            cell_2.render

            expect(cell_2.render).to eq(".") 
            

        end
    end 
    describe "what fire_upon does" do
        it "can fire at a ship" do
            
            cruiser = Ship.new("Cruiser", 3)
           
            @cell.place_ship(cruiser)

            expect(@cell.fire_upon?).to eq(false)

            @cell.fire_upon
            
            expect(@cell.ship.health).to eq(2)

            expect(@cell.fire_upon?).to eq(true)
        end
    


    end
end