# Given an m x n grid of characters board and a string word, return true if word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
# Output: true

@board = "not initialized"
@word = "not initialized"

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def word_exists(board, word)
  if board.nil? || board.empty? || word.nil?
    return false
  end
  @board = board
  @word = word
  puts "target word: #{@word}"
  puts "BOARD:"
  @board.each do |row|
    puts "#{row}"
  end
  @board.each_with_index do |row, i|
    row.each_with_index do |_, j|
        found_word = backtrack(0, i, j)
        if found_word
          return true
        end
    end
  end
  false
end

def backtrack(target_idx, row, col)
  puts "-------"
  puts "backtrack(), current target index: #{target_idx} (looking for #{@word[target_idx]}. row: #{row} col: #{col}"
  unless is_valid_coord(row, col)
    puts "coordinate not valid"
    return false
  end
  letter = @board[row][col]
  if  letter != @word[target_idx]
    puts "dead end for letter #{letter}"
    return false # dead end
  end
  if target_idx == @word.length - 1
    puts "we've reached the end of the target word, huzzah"
    return true
  end
  @board[row][col] = "%"
  found = backtrack(target_idx + 1, row + 1, col) ||
          backtrack(target_idx + 1, row, col + 1) ||
          backtrack(target_idx + 1, row - 1, col) ||
          backtrack(target_idx + 1, row, col - 1)
  @board[row][col] = letter
  found
end

def is_valid_coord(row, col)
  row >= 0 && col >= 0 && row < @board.length && col < @board[0].length
end