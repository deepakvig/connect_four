require "spec_helper"
require_relative "../lib/grid_search.rb"
 
describe GridSearch do
  before do
    @object = Object.new
    @object.extend(GridSearch)
  end

  context "#initialize" do
    it "is able to search in grid" do
      grid = [
        ["A", "B", "C", "E", "F", "G", "H"],
        ["I", "J", "K", "L", "M", "N", "O"],
        ["P", "Q", "R", "S", "T", "U", "V"],
        ["W", "X", "Y", "Z", "A", "B", "C"],
        ["I", "J", "K", "L", "M", "N", "O"],
        ["P", "Q", "R", "S", "T", "U", "V"],
        ["W", "X", "Y", "Y", "A", "B", "C"],
      ]

      expect(@object.search_in_grid grid, 'WQKZ').to be true
      expect(@object.search_in_grid grid, 'WXYZ').to be true
      expect(@object.search_in_grid grid, 'IPWI').to be true
      expect(@object.search_in_grid grid, 'IPWP').to be false
      expect(@object.search_in_grid grid, 'ZTNH').to be true
      expect(@object.search_in_grid grid, 'CVOC').to be true


      grid = [
        ["O","O","O","O","O","O"],
        ["O","O","O","O","O","O"],
        ["W","O","O","O","O","O"],
        ["R","R","O","O","O","W"],
        ["R","W","R","O","O","R"],
        ["W","W","R","R","O","W"],
        ["R","R","W","W","R","W"]
      ]

      expect(@object.search_in_grid grid, 'RRRR').to be true
    end
  end
end