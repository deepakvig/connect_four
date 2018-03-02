class Board
  attr_reader :row, :col, :grid

  # Initialize
  def initialize row, col
    @row, @col = row, col
    @grid = set_grid
  end

  # Clean the board to start over
  def clear
    @grid = set_grid
  end

  # Set color of the position
  def set_color(x, y, color)
    # Raise argument error if it is non numeric
    raise ArgumentError, 'Position doesnot exist' if x > @col || y > @row

    @grid[y-1][x-1] = color
    true
  end

  # Display the board grid current state
  def display
    @grid.each do |row|
      puts row.join('')
    end
    puts
  end

  private

  def set_grid
    grid = @grid || Array.new(@row)
    
    @row.times do |row|
      grid[row] = Array.new(@col, "O")
    end

    grid
  end
end
