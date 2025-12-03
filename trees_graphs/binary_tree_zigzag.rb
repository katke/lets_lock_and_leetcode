# Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

# Constraints:

# The number of nodes in the tree is in the range [0, 2000].
# -100 <= Node.val <= 100

# Example 1:
# https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg
# Input: root = [3,9,20,null,null,15,7]
# Output: [[3],[20,9],[15,7]]

# Example 2:
# Input: root = [1]
# Output: [[1]]

# Example 3:
# Input: root = []
# Output: []

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
# Time: O(n)
# Space: O(w) where w is the maximum width of the tree (worst case O(n))
def zigzag_level_order(root)
    if root.nil?
        return []
    end
    queue = Queue.new
    queue.enq(root)
    direction = 1 # odd num, L to R; even num, R to L
    rows = []
    while !queue.empty? do
        row_size = queue.size
        if direction % 2 == 0
            # R to L
            row = Array.new(row_size)
            curr_index = row_size - 1
            while curr_index >= 0 do
                curr_node = queue.deq()
                row[curr_index] = curr_node.val
                unless curr_node.left.nil?
                    queue.enq(curr_node.left)
                end
                unless curr_node.right.nil?
                    queue.enq(curr_node.right)
                end
                curr_index -= 1
            end
        else
            row = Array.new(row_size)
            # L to R
            (0..row_size - 1).each do |i|
                curr_node = queue.deq()
                row[i] = curr_node.val
                unless curr_node.left.nil?
                    queue.enq(curr_node.left)
                end
                unless curr_node.right.nil?
                    queue.enq(curr_node.right)
                end
            end
        end
        direction += 1
        rows.push(row)
    end
    rows
end