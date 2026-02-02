# This question is about implementing a basic elimination algorithm for Candy Crush.
#
#   Given an m x n integer array board representing the grid of candy where board[i][j] represents the type of candy. A value of board[i][j] == 0 represents that the cell is empty.
#
#   The given board represents the state of the game following the player's move. Now, you need to restore the board to a stable state by crushing candies according to the following rules:
#
# If three or more candies of the same type are adjacent vertically or horizontally, crush them all at the same time - these positions become empty.
# After crushing all candies simultaneously, if an empty space on the board has candies on top of itself, then these candies will drop until they hit a candy or bottom at the same time. No new candies will drop outside the top boundary.
# After the above steps, there may exist more candies that can be crushed. If so, you need to repeat the above steps.
# If there does not exist more candies that can be crushed (i.e., the board is stable), then return the current board.
# You need to perform the above rules until the board becomes stable, then return the stable board.
#
# Ex: https://assets.leetcode.com/uploads/2018/10/12/candy_crush_example_2.png
#
# Constraints:
#
# m == board.length
# n == board[i].length
# 3 <= m, n <= 50
# 1 <= board[i][j] <= 2000
def candy_crush(board)
  if board.nil? || board.empty? || board[0].empty?
    return [[]]
  end
  candies_found = true
  while candies_found
    candies_found = search_candies(board)
  end
  puts "result"
  board.each_with_index do |row, index|
    puts "#{row}"
  end
  board
end

def search_candies(board)
  visited = Set.new
  to_be_crushed = Set.new
  directions = [1,-1]
  rows = board.size.freeze
  columns = board[0].size.freeze
  found_candies = false
  queue = []
  board.each_with_index do |row, i|
    row.each_with_index do |col, j|
      puts "--"
      vertical_streak = []
      horizontal_streak = []
      unless visited.include?(stringify_coordinates([i,j]))
        queue.push([i,j])
        vertical_streak << [i,j]
        curr_streak_val = board[i][j]
        puts "curr_streak_val: #{curr_streak_val}"
      end
      # Check vertical first
      until queue.empty? do
        puts "++"
        curr_coor = queue.shift
        curr_row = curr_coor[0]
        curr_col = curr_coor[1]
        visited.add(stringify_coordinates([curr_row,curr_col]))
        # check vertical neighbors
        directions.each do |direction|
          next_row = curr_row + direction
          unless is_valid_coordinate(rows, columns, [next_row, curr_col])
            next
          end
          is_part_of_streak = curr_streak_val == board[next_row][curr_col]
          unless is_part_of_streak && !visited.include?(stringify_coordinates([next_row, curr_col]))
            next
          end
          vertical_streak << [next_row, curr_col]
          queue << [next_row, curr_col]
        end
      end
      # check horizontal neighbors
      unless visited.include?(stringify_coordinates([i,curr_col]))
        queue.push([i,j])
        horizontal_streak <<[[i,j]]
        curr_streak_val = board[i][j]
      end
      until queue.empty? do
        puts "=="
        curr_coor = queue.shift
        curr_row = curr_coor[0]
        curr_col = curr_coor[1]
        visited.add(stringify_coordinates([curr_row,curr_col]))
        directions.each do |direction|
          next_col = curr_col + direction
          unless is_valid_coordinate(rows, columns, [curr_row, next_col])
            next
          end
          is_part_of_streak = curr_streak_val == board[curr_row][next_col]
          unless is_part_of_streak && !visited.include?(stringify_coordinates([curr_row,next_col]))
            next
          end
          horizontal_streak << [curr_row, next_col]
          # check for min 3 horizontal vs vertical
          queue.push([curr_row, next_col])
        end
      end
      puts "horizontal streak: #{horizontal_streak}"
      puts "vertical streak: #{vertical_streak}"
      if horizontal_streak.size >= 3
        found_candies = true
        horizontal_streak.each  { |coordinates| to_be_crushed.add(coordinates) }
      end
      if vertical_streak.size >= 3
        found_candies = true
        horizontal_streak.each  { |coordinates| to_be_crushed.add(coordinates) }
      end
    end
  crush_candies(board, to_be_crushed)
  found_candies
  rescue => ex
    puts ex.message
  end
end

def traverse_streak(board, start_coords, visited, is_horizontal = true)
  directions = [1,-1]
  curr_streak_val = board[start_coords[0]][start_coords[1]]
  streak = Set.new
  queue = []
  queue.push(start_coords)
  until queue.empty? do
    curr_coor = queue.shift
    curr_row = curr_coor[0]
    curr_col = curr_coor[1]
    visited.add(stringify_coordinates([curr_row,curr_col]))
    directions.each do |direction|
      next_row = curr_row
      next_col = curr_col
      if is_horizontal
        next_col = curr_col + direction
      else
        next_row = curr_row + direction
      end
      unless is_valid_coordinate(board.size, board[0].size, [next_row, next_col])
        next
      end
      is_part_of_streak = curr_streak_val == board[next_row][next_col]
      unless is_part_of_streak && !visited.include?(stringify_coordinates([next_row, next_col]))
        next
      end
      streak.add([next_row, next_col])
      queue.push([next_row, next_col])
    end
  end
  streak
end

def stringify_coordinates(coordinates)
  if coordinates.is_a?(Array)
    "#{coordinates[0]}_#{coordinates[1]}"
  else
    raise Exception("expecting array coordinates, where 0=row index, and 1=col index")
  end
end

def destringify_coordinates(coordinates)
  if coordinates.is_a?(String)
    coord_arr = coordinates.split('_')
    [coord_arr[0].to_i, coord_arr[1].to_i]
  else
    raise Exception("expecting string coordinates with _ delimiter")
  end
end

def crush_candies(board, streak)
  # fill in zeros where we crushed candies
  # streak.each do |coord|
  #   crushed_row = coord[0]
  #   crushed_col = coord[1]
  #   board[crushed_row][crushed_col] = 0
  # end
  # drop rest of board based on where we crushed candies
    streak.each do |coord|
      crushed_row = coord[0]
      crushed_col = coord[1]
      curr_row = crushed_row
      while curr_row > 0
        above_val = board[curr_row - 1][crushed_col]
        board[curr_row][crushed_col] = above_val
        curr_row -= 1
      end
      board[curr_row][crushed_col] = 0
    end
end

def is_valid_coordinate(rows_count, cols_count, coordinates)
  coordinates[0] >= 0 && coordinates[0] < rows_count && coordinates[1] >= 0 && coordinates[1] < cols_count
end