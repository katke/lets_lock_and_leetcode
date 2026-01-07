# You are given an m x n integer matrix matrix with the following two properties:
#
#                                                                       Each row is sorted in non-decreasing order.
#   The first integer of each row is greater than the last integer of the previous row.
#     Given an integer target, return true if target is in matrix or false otherwise.
#
#   You must write a solution in O(log(m * n)) time complexity.
#
# Constraints:
#
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 100
# -10^4 <= matrix[i][j], target <= 10^4
#
#  Example 1:
#  https://assets.leetcode.com/uploads/2020/10/05/mat.jpg
# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
# Output: true
#
# Ex 2:
# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
# Output: false

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix_iterative(matrix, target)
  if matrix.nil? || matrix.empty? || matrix[0].length == 0
    return false
  end
  start_i = 0
  end_i = matrix[0].length * matrix.length - 1
  n_per_row = matrix[0].length
  while start_i <= end_i
    mid_i = (end_i + start_i) / 2
    row_i = mid_i / n_per_row
    col_i = mid_i % n_per_row
    mid_val = matrix[row_i][col_i]
    if mid_val == target
      return true
    elsif mid_val < target
      start_i = mid_i + 1
    else
      end_i = mid_i - 1
    end
  end
  false
end

def search_matrix_recursive(matrix, target)
  if matrix.nil? || matrix.empty? || matrix[0].length == 0
    return false
  end
  binary_search_2d(0, matrix[0].length * matrix.length - 1, matrix, target)
end

def binary_search_2d(start_i, end_i, matrix, target)
  n_per_row = matrix[0].length
  if end_i == start_i
    row_i = start_i / n_per_row
    col_i = start_i % n_per_row
    return target == matrix[row_i][col_i]
  elsif end_i - start_i < 0
    return false
  end
  mid_i = (end_i + start_i) / 2
  row_i = mid_i / n_per_row
  col_i = mid_i % n_per_row
  mid_val = matrix[row_i][col_i]
  if mid_val == target
    return true
  elsif mid_val < target
    binary_search_2d(mid_i + 1, end_i, matrix, target)
  else
    binary_search_2d(start_i, mid_i - 1, matrix, target)
  end
end

def search_matrix_space_unoptimized(matrix, target)
  if matrix.nil? || matrix.empty?
    return false
  end
  matrix_1d = []
  matrix.each do |row|
    row.each do |col|
      matrix_1d.push(col)
    end
  end
  binary_search_row(matrix_1d, target)
end

def search_matrix_medium_optimized(matrix, target)
  if matrix.nil? || matrix.empty?
    return false
  end
  matrix.each do |row|
    if target > row[-1]
      next
    elsif target <= row[-1] && target >= row[0]
      return binary_search_row(row, target)
    end
  end
  false
end

def binary_search_row(row, target)
  if row.empty?
    return false
  elsif row.length == 1
    return row[0] == target
  end
  mid = row.length / 2
  if target == row[mid]
    return true
  elsif target > row[mid]
    binary_search_row(row.slice(mid + 1, row.length), target)
  else
    binary_search_row(row.slice(0, mid), target)
  end
end

def search_matrix_brute_force(matrix, target)
  if matrix.nil? || matrix.empty?
    return false
  end
  matrix.each do |row|
    row.each do |col|
      if col == target
        return true
      end
    end
  end
  false
end