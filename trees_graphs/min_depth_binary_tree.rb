# Given a binary tree, find its minimum depth.

# The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

# Constraints:

# The number of nodes in the tree is in the range [0, 105].
# -1000 <= Node.val <= 1000

# Input: root = [3,9,20,null,null,15,7]
# Output: 2

# Input: root = [2,null,3,null,4,null,5,null,6]
# Output: 5

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
# Runtime: O(n)
# Space: O(n)
def min_depth(root)
    if root.nil?
        return 0
    end
    if root.left.nil?
        return 1 + min_depth(root.right)
    elsif root.right.nil?
        return 1 + min_depth(root.left)
    end
    left = min_depth(root.left)
    right = min_depth(root.right)
    return left < right ? left + 1 : right + 1
end