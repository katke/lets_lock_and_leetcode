# Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target. If there are multiple answers, print the smallest.

# Constraints:

# The number of nodes in the tree is in the range [1, 10^4].
# 0 <= Node.val <= 10^9
# -10^9 <= target <= 10^9

# Example 1:
# https://assets.leetcode.com/uploads/2021/03/12/closest1-1-tree.jpg

# Input: root = [4,2,5,1,3], target = 3.714286
# Output: 4

# Example 2:
# Input: root = [1], target = 4.428571
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
# @param {Float} target
# @return {Integer}
# Time: O(n) -- visits every node
# Space: O(H) -- call stack for longest tree path; o(n) for worst case
def closest_value_suboptimal(root, target)
    if root.nil?
        return nil
    end
    find_closest_val(root, target, root.val)
end

def find_closest_val_suboptimal(node, target, smallest_diff_val)
    if node.nil?
        return smallest_diff_val
    end
    node_diff = node.val - target
    new_smallest_diff_val = smallest_diff_val
    if node_diff.abs() < (smallest_diff_val - target).abs()
        new_smallest_diff_val = node.val
    elsif node_diff.abs() == (smallest_diff_val - target).abs()
        new_smallest_diff_val = [node.val, smallest_diff_val].min
    end

    left_smallest_diff_val = find_closest_val_suboptimal(node.left, target, new_smallest_diff_val)
    right_smallest_diff_val = find_closest_val_suboptimal(node.right, target, new_smallest_diff_val)

    left_diff = (left_smallest_diff_val - target).abs()
    right_diff = (right_smallest_diff_val - target).abs()

    if left_diff < right_diff
        left_smallest_diff_val
    elsif left_diff == right_diff
        [left_smallest_diff_val, right_smallest_diff_val].min
    else
        right_smallest_diff_val
    end
end

# Time: O(log n) for balanced tree; O(n) for worst case
# Space: O(H) -- call stack for longest tree path; o(n) for worst case
def closest_value(root, target)
    if root.nil?
        return nil
    end
    find_closest_val(root, target, root.val)
end

def find_closest_val(node, target, closest)
    if node.nil?
        return closest
    end
    node_diff = (target - node.val).abs()
    closest_diff = (target - closest).abs()
    new_closest = closest
    if node_diff < closest_diff
        new_closest = node.val
    elsif node_diff == closest_diff
        new_closest = [closest, node.val].min
    end

    if target < node.val
        return find_closest_val(node.left, target, new_closest)
    elsif target > node.val
        return find_closest_val(node.right, target, new_closest)
    else
        return node.val
    end
end