require './lib/ship'

RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end
    describe "attributes of cruiser" do
        it 'exists' do
            expect(@cruiser).to be_a(Ship)
        end
        it 'has a name' do
            expect(@cruiser.name).to eq("Cruiser")
        end
        it 'has a length' do
            expect(@cruiser.length).to eq(3)
        end
        it 'has health' do
            expect(@cruiser.health).to eq(3)
        end
    end
    describe "sunk?" do
        it 'can determine if ship is sunk' do
            expect(@cruiser.sunk?).to be(false)
        end
    end
    describe "hit" do
        it 'can take a hit' do
            expect(@cruiser.sunk?).to be(false)

            @cruiser.hit

            expect(@cruiser.health).to eq(2)

            @cruiser.hit

            expect(@cruiser.health).to eq(1)

            expect(@cruiser.sunk?).to be(false)

            @cruiser.hit

            expect(@cruiser.health).to eq(0)

            expect(@cruiser.sunk?).to be(true)

        end
    end
end