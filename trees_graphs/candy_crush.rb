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
  puts "search candies ---------START"
  visited = Set.new
  to_be_crushed = Set.new
  found_candies = false
  board.each_with_index do |row, i|
    row.each_with_index do |col, j|
      vertical_streak = traverse_potential_streak(board, [i,j], visited, false)
      puts "vertical streak: #{vertical_streak}"
      horizontal_streak = traverse_potential_streak(board, [i,j], visited)
      puts "horizontal streak: #{horizontal_streak}"
      if horizontal_streak.size >= 3
        found_candies = true
        horizontal_streak.each  { |coordinates| to_be_crushed.add(coordinates) }
      end
      if vertical_streak.size >= 3
        found_candies = true
        vertical_streak.each  { |coordinates| to_be_crushed.add(coordinates) }
      end
    end
  end
  crush_candies(board, to_be_crushed)
  found_candies
end

def traverse_potential_streak(board, start_coords, visited, is_horizontal = true)
  puts "start_coords: #{start_coords}"
  directions = [1,-1]
  curr_streak_val = board[start_coords[0]][start_coords[1]]
  if curr_streak_val == 0
    visited << start_coords
    return Set.new
  end
  streak = Set.new
  queue = []
  queue.push(start_coords)
  streak.add(start_coords)
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
  streak.size >= 3 ? streak : Set.new
end

def stringify_coordinates(coordinates)
  if coordinates.is_a?(Array)
    "#{coordinates[0]}_#{coordinates[1]}"
  else
    raise Exception("expecting array coordinates, where 0=row index, and 1=col index")
  end
end

def crush_candies(board, streak)
  puts "crushing candies for streak: #{streak}"
  # fill in zeros where we crushed candies
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