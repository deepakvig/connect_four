class Player
  attr_reader :board, :name, :color
  
  def initialize( name, color, board )
   @name = name
   @color = color
   @board = board
  end

  def make_move
    loop do
      col = ask_user
      # validate correct column
      if @board.valid_column?(col)
        # then validate column is not full
        if @board.drop_color(col, @color )
          break
        end
      else
        puts "Please enter a valid column"
      end
    end
  end

  def ask_user
    puts("#{@name}, enter which column number from #{@board.columns_with_space.join(",")} to place your column")
    gets.strip.to_i
  end
end