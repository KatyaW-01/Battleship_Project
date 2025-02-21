require "./lib/board"
require "./lib/cell"
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
end