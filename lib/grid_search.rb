# Module to search a text in a grid
module GridSearch

  # For searching in all 8 direction
  X = [ -1, -1, -1,  0, 0,  1, 1, 1 ]
  Y = [ -1,  0,  1, -1, 1, -1, 0, 1 ]

  # Search value in the given Grid
  def search_in_grid grid, val=''
    return false unless val
    return false if val.length == 0
    
    # Go to each position and start searching
    grid.size.times do |row|
      grid[row].size.times do |col|
        if search_grid(grid, row, col, val)
          return true
        end
      end
    end

    false
  end

  private

  def search_grid(grid, row, col, word)
    # If first character of word doesn't match with
    # given starting point in grid.
    return false if (grid[row][col] != word[0])

    len = word.length
    # Search word in all 8 directions starting from (row,col)
    (0..7).each do |i|
      rd = row + X[i]
      cd = col + Y[i]
 
      # First character is already checked, match remaining characters
      (1..len-1).each do |j|
        # If out of bound break
        if rd < grid.size && rd >= 0 && cd < grid[0].size && cd >= 0
          # If not matched,  break
          if grid[rd][cd] == word[j]
            #  Moving in particular direction
            rd += X[i]
            cd += Y[i]
            
            # If all character matched, then value of must
            # be equal to length of word
            if (j == len-1)
              return true
            end
          else
            break
          end
        end
      end
    end

    return false  
  end

end