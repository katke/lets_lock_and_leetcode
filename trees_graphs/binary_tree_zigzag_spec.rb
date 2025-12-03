require_relative './binary_tree_zigzag'
require_relative '../helpers/tree_node'

describe "#zigzag_level_order" do
    it "should return the correct output for provided example 1" do
        # https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg
        root = TreeNode.new(3)
        # Level 2
        root.left = TreeNode.new(9)
        root.right = TreeNode.new(20)
        # Level 3
        root.right.left = TreeNode.new(15)
        root.right.right = TreeNode.new(7)

        result = zigzag_level_order(root)
        expect(result).to eq([[3],[20,9],[15,7]])
    end

    it "should return the correct output for provided example 2" do
        root = TreeNode.new(1)

        result = zigzag_level_order(root)
        expect(result).to eq([[1]])
    end

    it "should return the correct output for provided example 3" do
        result = zigzag_level_order(nil)
        expect(result).to eq([])
    end

    it "should return the correct output for provided example 1" do
        # https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg
        root = TreeNode.new(3)
        # Level 2
        root.left = TreeNode.new(9)
        root.right = TreeNode.new(20)
        # Level 3
        root.right.left = TreeNode.new(15)
        root.right.right = TreeNode.new(7)
        # Level 4
        root.right.left.left = TreeNode.new(16)
        root.right.right.right = TreeNode.new(8)

        result = zigzag_level_order(root)
        expect(result).to eq([[3],[20,9],[15,7],[8,16]])
    end
end