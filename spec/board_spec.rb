require "./lib/board"
require "./lib/cell"
require './lib/ship'
require "pry"

RSpec.describe Board do
    before :each do
        @board = Board.new
    end
    describe "initialize" do
        it "exist" do
            expect(@board).to be_a(Board)
        end
    end
    describe "the cells board has" do
        it "has cell objects" do
            expect(@board.cells).to be_a(Hash)
        end
        it "" do
            expect(@board.cells.keys.length).to eq(16)
        end
    end
    describe "can validate coordinates" do
        it "can tell if a coordinate is on the board" do
            expect(@board.valid_coordinate?("A1")).to be(true)
            expect(@board.valid_coordinate?("D4")).to be(true)
            expect(@board.valid_coordinate?("A5")).to be(false)
            expect(@board.valid_coordinate?("E1")).to be(false)
            expect(@board.valid_coordinate?("A22")).to be(false)
        end
    end
    describe "validating placement" do
        it 'can tell if a ship placement is valid' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
            expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
            expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
            expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"]).to be(false)
            expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
            expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
            expect(@board.valid_placement?(submarine, ["C2", "D3"])).to be(false)
            expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
            expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"]).to be(true))
        end
    end
end