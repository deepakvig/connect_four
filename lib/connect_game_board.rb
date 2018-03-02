require_relative "./grid_search.rb"
require_relative "./board.rb"

class ConnectGameBoard < Board
  include GridSearch

  def drop_color col, color
    return false unless valid_column?(col) && col_has_vacant_pos?(col)

    row = get_vacant_pos(col)

    set_color(col, row, color) 
  end

  def columns_with_space
    cols = []
    (1..@col).each do |col|
      cols << col if col_has_vacant_pos?(col)
    end

    cols
  end

  def win? txt
    search_in_grid(@grid, txt)
  end

  # Check if the column is a valid colun on GameBoard
  def valid_column? col
    !!(col <= @col)
  end

  private

  # Check if the column has any vacant position
  def col_has_vacant_pos? col
    !!get_vacant_pos(col)
  end

  # Get vacant position in column
  def get_vacant_pos col
    vacant_position = nil

    @row.times do |idx|
      if @grid[idx][col-1] == "O"
        vacant_position = idx + 1
      else
        break
      end
    end

    vacant_position
  end

end