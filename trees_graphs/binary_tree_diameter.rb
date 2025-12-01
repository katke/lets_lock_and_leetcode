# Given the root of a binary tree, return the length of the diameter of the tree.

# The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

# The length of a path between two nodes is represented by the number of edges between them.

# Constraints:

# The number of nodes in the tree is in the range [1, 10^4].
# -100 <= Node.val <= 100

# Example 1:
# https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg
# Input: root = [1,2,3,4,5]
# Output: 3
# Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].

# Example 2:
# Input: root = [1,2]
# Output: 1

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
# @return {Integer}
def diameter_of_binary_tree(root)
    if root.nil?
        return 0
    end
    left = dfs(root.left, 0, [])
    puts "left #{left}"
    right = dfs(root.right, 0, [])
    puts "right #{right}"
    puts "result: #{left + right}"
    left + right
end

def dfs(root, max_path, path)
    new_path = Array.new(path)
    if root.nil?
        puts "dfs: root is nil, returning max_path #{max_path} for path: #{new_path}"
        return max_path
    else
        new_path.push(root.val)
        puts "dfs: root is #{root.val}, max_path currently #{max_path} for path: #{new_path}"
    end
    left = dfs(root.left, max_path + 1, new_path)
    right = dfs(root.right, max_path + 1, new_path)
    left + right
    # [left, right].max
end