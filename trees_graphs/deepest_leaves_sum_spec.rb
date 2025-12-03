require_relative './deepest_leaves_sum'
require_relative '../helpers/tree_node'

describe "#deepest_leaves_sum" do
    it "should return the correct output for provided example 1" do
        # https://assets.leetcode.com/uploads/2019/07/31/1483_ex1.png
        root = TreeNode.new(1)
        # Level 2
        root.left = TreeNode.new(2)
        root.right = TreeNode.new(3)
        # Level 3
        root.left.left = TreeNode.new(4)
        root.left.right = TreeNode.new(5)
        root.right.right = TreeNode.new(6)
        # Level 4
        root.left.left.left = TreeNode.new(7)
        root.right.right.right = TreeNode.new(8)

        result = deepest_leaves_sum(root)
        expect(result).to eq(15)
    end

    it "should return the correct output for provided example 2" do
#         Tree representation:
#            6
#         /     \
#       7         8
#     /   \     /   \
#   2      7   1     3
#  /      / \         \
# 9      1   4         5
        root = TreeNode.new(6)
        # Level 2
        root.left = TreeNode.new(7)
        root.right = TreeNode.new(8)
        # Level 3
        root.left.left = TreeNode.new(2)
        root.left.right = TreeNode.new(7)
        root.right.left = TreeNode.new(1)
        root.right.right = TreeNode.new(3)
        # Level 4
        root.left.left.left = TreeNode.new(9)
        root.left.right.left = TreeNode.new(1)
        root.left.right.right = TreeNode.new(4)
        root.right.right.right = TreeNode.new(5)

        result = deepest_leaves_sum(root)
        expect(result).to eq(19)
    end
end