require "./lib/board"
require "./lib/cell"
require './lib/ship'
require './lib/game'
require "pry"

RSpec.describe Game do
    before(:each) do
        @game = Game.new
        
    end
    describe "Class" do
        it "exists" do
            expect(@game).to be_a(Game)
        end
    end
    describe "welcome message" do
        it 'has a welcome message' do
            expect(@game.welcome_message).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
        end
    end
    
end