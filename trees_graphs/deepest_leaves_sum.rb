# Given the root of a binary tree, return the sum of values of its deepest leaves.
# Constraints:

# The number of nodes in the tree is in the range [1, 104].
# 1 <= Node.val <= 100

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
# Time: O(n)
# Space: O(n/2) => O(n) 
def deepest_leaves_sum(root)
    if root.nil?
        return 0
    end
    queue = Queue.new
    queue.enq(root)
    while !queue.empty? do
        sum = 0
        (1..queue.size).each do
            curr_node = queue.deq()
            sum += curr_node.val

            unless curr_node.left.nil?
                queue.enq(curr_node.left)
            end
            unless curr_node.right.nil?
                queue.enq(curr_node.right)
            end
        end
    end
    sum
end