# You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

# The area of an island is the number of cells with a value 1 in the island.

# Return the maximum area of an island in grid. If there is no island, return 0.

# Example 1:
# https://assets.leetcode.com/uploads/2021/05/01/maxarea1-grid.jpg
# Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
# Output: 6
# Explanation: The answer is not 11, because the island must be connected 4-directionally.

# @param {Integer[][]} grid
# @return {Integer}
# Time: O((n * m) * 4) => O(n * m)
# Space: O(n * m * n * m) => O(n * m)
def max_area_of_island(grid)
    directions = [[1,0], [0,1], [-1,0], [0,-1]]
    seen = Array.new(grid.length) { Array.new(grid[0].length, false) }
    max_area = 0
    curr_area = 0
    grid.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
            if grid[row_index][col_index] == 1 && !seen[row_index][col_index]
                seen[row_index][col_index] = true
                stack = []
                curr_area = 1
                stack.push([row_index, col_index])
                while !stack.empty?
                    curr_coordinates = stack.pop()
                    directions.each do |dir|
                        next_row = curr_coordinates[0] + dir[0]
                        next_col = curr_coordinates[1] + dir[1]
                        is_in_bounds = next_row >= 0 && next_row < grid.length && next_col >= 0 && next_col < grid[0].length
                        if is_in_bounds 
                            if grid[next_row][next_col] == 1 && !seen[next_row][next_col]
                                curr_area += 1
                                stack.push([next_row, next_col])
                            end
                            seen[next_row][next_col] = true
                        end
                    end
                end
                max_area = [max_area, curr_area].max
            end
            seen[row_index][col_index] = true
        end
    end
    max_area
end