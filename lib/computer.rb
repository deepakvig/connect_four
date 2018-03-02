require_relative './player.rb'

class Computer < Player
 
  # Computer will generate a move - this is random
  def generate_move
    @board.columns_with_space.sample
  end
  
  def ask_user
    # since we inherit from player we can override the player method with this call to generate_move
    col = generate_move
    puts "Computer selected column #{col}"
    col
  end
end