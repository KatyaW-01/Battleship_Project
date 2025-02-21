require './lib/ship'
require './lib/cell'

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
        end
    end
end