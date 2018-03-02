require "spec_helper"
require_relative "../lib/board.rb"
 
describe Board do
  context "#initialize" do
    it "is initialized with a value by default" do
      board = Board.new 5, 5
      expect(board.row).to eq 5
      expect(board.col).to eq 5

      board.grid.each do |row|
        expect(row.size).to eq 5
      end

      expect(board.grid[0][0]).to eq "O"
    end
  end

  context "#set_color" do
    it "should set color for a position" do
      board = Board.new 5, 5
      board.set_color(2,2,"W")

      expect(board.grid[1][1]).to eq "W"
    end

    it "should raise argument error if pixel doesn't exist" do
      board = Board.new 1, 1
      expect { board.set_color(2,2,"W") }.to raise_error(ArgumentError)
    end
  end

  context "#clear" do
    it "should clear the bitmap" do
      board = Board.new 5, 5
      board.set_color(2,2,"W")
      board.clear

      expect(board.grid[1][1]).to eq "O"
    end
  end

  context "#display" do
    it "should display the bitmap" do
      board = Board.new 3, 3
      board.set_color(2,2,"W")

      expect { board.display }.to output("OOO\nOWO\nOOO\n\n").to_stdout   
    end
  end
end