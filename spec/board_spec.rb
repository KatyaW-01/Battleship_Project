require "./lib/board"
require "./lib/cell"

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

end