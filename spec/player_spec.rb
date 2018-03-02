require "spec_helper"
require_relative "../lib/player.rb"
 
describe Player do
  context "#initialize" do
    it "is initialized with a name, color and board" do
      player = Player.new("Deepak", "R", ConnectGameBoard.new(7,6))
      expect(player.name).to eq "Deepak"
      expect(player.color).to eq "R"

      expect(player.board.grid.size).to eq 7

      player.board.grid.each do |row|
        expect(row.size).to eq 6
      end

      expect(player.board.grid[0][0]).to eq "O"
    end
  end

  context "#make_move" do
    before do
      Object.any_instance.stub(gets: '1')
    end

    it "should ask for column" do
      player = Player.new("Deepak", "R", ConnectGameBoard.new(7,6))
      
      expect { player.make_move }.to output("Deepak, enter which column number from 1,2,3,4,5,6 to place your column\n").to_stdout   
    end
  end
end