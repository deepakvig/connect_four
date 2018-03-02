require "spec_helper"
require_relative "../lib/computer.rb"
 
describe Computer do
  context "#make_move" do
    before do
      Computer.any_instance.stub(generate_move: 1)
    end

    it "should generate column automatically" do
      computer = Computer.new("Computer", "B", ConnectGameBoard.new(7,6))
      
      expect { computer.make_move }.to output("Computer selected column 1\n").to_stdout   
    end
  end
end