# Given the root of a binary tree, find the maximum value v for which there exist different nodes a and b where v = |a.val - b.val| and a is an ancestor of b.

# A node a is an ancestor of b if either: any child of a is equal to b or any child of a is an ancestor of b.

# Constraints:

# The number of nodes in the tree is in the range [2, 5000].
# 0 <= Node.val <= 10^5

# Example 1:
# https://assets.leetcode.com/uploads/2020/11/09/tmp-tree.jpg

# Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
# Output: 7
# Explanation: We have various ancestor-node differences, some of which are given below :
# |8 - 3| = 5
# |3 - 7| = 4
# |8 - 1| = 7
# |10 - 13| = 3
# Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.

# Example 2:
# https://assets.leetcode.com/uploads/2020/11/09/tmp-tree-1.jpg
# Input: root = [1,null,2,null,0,3]
# Output: 3

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
def max_ancestor_diff(root)
    if root.nil?
        return 0
    end
    queue = Queue.new
    queue.enq(root)
    subtree_diffs = [0] # initialize with zero to prevent it blowing up on first iteration
    while !queue.empty?
        curr = queue.deq()
        subtree_diffs.push(get_largest_subtree_diff(curr, curr.val, subtree_diffs.max))
        if !curr.left.nil?
            queue.enq(curr.left)
        end
        if !curr.right.nil?
            queue.enq(curr.right)
        end
    end
    subtree_diffs.max
end


def get_largest_subtree_diff(node, root_val, curr_max)
    if node.nil?
        return curr_max
    end
    diff = (root_val - node.val).abs()
    new_max = [diff, curr_max].max

    if node.left.nil?
        return get_largest_subtree_diff(node.right, root_val, new_max)
    elsif node.right.nil?
        return get_largest_subtree_diff(node.left, root_val, new_max)
    end
    
    left_child_diff = get_largest_subtree_diff(node.left, root_val, new_max)
    right_child_diff = get_largest_subtree_diff(node.right, root_val, new_max)
    return [left_child_diff, right_child_diff, new_max].max
end