require "spec_helper"
require_relative "../lib/connect_game_board.rb"
 
describe ConnectGameBoard do
  context "#drop_color" do
    it "should drop color in a valid column" do
      board = ConnectGameBoard.new 7, 6
      board.drop_color(2,"W")

      expect(board.grid[6][1]).to eq "W"
      expect(board.grid[5][1]).to eq "O"
    end

    it "should not drop color in a column with no space" do
      board = ConnectGameBoard.new 1, 1
      expect(board.drop_color(1,"W")).to be true
      expect(board.drop_color(1,"W")).to be false
    end

    it "should not drop color in out of bound column" do
      board = ConnectGameBoard.new 1, 1
      expect(board.drop_color(2,"W")).to be false
    end
  end

  context "#columns_with_space" do
    it "should give the list of columns with empty space" do
      board = ConnectGameBoard.new 2, 2
      
      expect(board.columns_with_space).to eq [1,2]

      board.drop_color(1,"W")
      expect(board.columns_with_space).to eq [1,2]

      board.drop_color(1,"W")
      expect(board.columns_with_space).to eq [2]            
    end
  end

  context "#win?" do
    it "should check for the text in the grid" do
      board = ConnectGameBoard.new 7, 6
      
      board.drop_color(1,"W")
      board.drop_color(1,"W")
      expect(board.win?('WWWW')).to eq false

      board.drop_color(1,"W")
      expect(board.win?('WWWW')).to eq false

      board.drop_color(1,"W")

      expect(board.win?('WWWW')).to eq true
    end
  end
end