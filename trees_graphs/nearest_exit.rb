# You are given an m x n matrix maze (0-indexed) with empty cells (represented as '.') and walls (represented as '+'). You are also given the entrance of the maze, where entrance = [entrancerow, entrancecol] denotes the row and column of the cell you are initially standing at.

# In one step, you can move one cell up, down, left, or right. You cannot step into a cell with a wall, and you cannot step outside the maze. Your goal is to find the nearest exit from the entrance. An exit is defined as an empty cell that is at the border of the maze. The entrance does not count as an exit.

# Return the number of steps in the shortest path from the entrance to the nearest exit, or -1 if no such path exists.

# maze.length == m
# maze[i].length == n
# 1 <= m, n <= 100
# maze[i][j] is either '.' or '+'.
# entrance.length == 2
# 0 <= entrancerow < m
# 0 <= entrancecol < n
# entrance will always be an empty cell.

# Example 1:
# https://assets.leetcode.com/uploads/2021/06/04/nearest1-grid.jpg
# Input: maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], entrance = [1,2]
# Output: 1
# Explanation: There are 3 exits in this maze at [1,0], [0,2], and [2,3].
# Initially, you are at the entrance cell [1,2].
# - You can reach [1,0] by moving 2 steps left.
# - You can reach [0,2] by moving 1 step up.
# It is impossible to reach [2,3] from the entrance.
# Thus, the nearest exit is [0,2], which is 1 step away.

# @param {Character[][]} maze
# @param {Integer[]} entrance
# @return {Integer}
# Runtime: O(n * m * 4) => O(n * m)
# Space: O(m + n) => O (n + m)
require "set"

def nearest_exit(maze, entrance)
    directions = [[0,1], [1,0], [-1, 0], [0,-1]]
    seen = Set[]
    queue = []
    queue.push(Node.new(entrance))
    while !queue.empty? do
        curr_node = queue.shift()
        directions.each do |direction|  
            new_row = curr_node.row + direction[0]
            new_col = curr_node.col + direction[1]
            seen_set_key = build_seen_set_key([new_row, new_col])
            if is_valid?(maze, [new_row, new_col]) && !seen.include?(seen_set_key)
                new_node = Node.new([new_row, new_col], curr_node.steps)
                move_type = get_move_type(maze, entrance, new_node)
                if move_type == CoordinateType::EXIT
                    return curr_node.steps
                elsif move_type == CoordinateType::OPEN
                    seen.add(seen_set_key)
                    queue.push(new_node)
                end
            end
        end
    end
    -1
end

def build_seen_set_key(coordinates)
    "#{coordinates[0]},#{coordinates[1]}"
end

def is_valid?(maze, coordinates)
    row = coordinates[0]
    col = coordinates[1]
    row >= 0 && row < maze.length && col >= 0 && col < maze[0].length
end

def get_move_type(maze, entrance, node)
    is_empty = maze[node.row][node.col] == "."
    is_first_or_last_row = node.row == 0 || node.row == maze.length - 1
    is_first_or_last_col = node.col == 0 || node.col == maze[0].length - 1
    is_entrance = node.row == entrance[0] && node.col == entrance[1]
    if is_empty && (is_first_or_last_row || is_first_or_last_col) && !is_entrance
        CoordinateType::EXIT
    elsif is_empty
        CoordinateType::OPEN
    else
        CoordinateType::WALL
    end
end

module CoordinateType
  WALL = :wall
  OPEN = :open
  EXIT = :exit
end

class Node
    attr_reader :coordinates
    attr_reader :row
    attr_reader :col
    attr_reader :steps

    def initialize(coordinates, steps = 0)
        @coordinates = coordinates
        @row = coordinates[0]
        @col = coordinates[1]
        @steps = steps + 1
    end
end