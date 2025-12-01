require_relative './binary_tree_diameter'
require_relative '../helpers/tree_node'

describe "#diameter_of_binary_tree" do
    it "should return the correct output for provided example 1" do
        # https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg
        root = TreeNode.new(1)
        # Level 1
        root.left = TreeNode.new(2)
        root.right = TreeNode.new(3)
        # Level 2
        root.left.left = TreeNode.new(4)
        root.left.right = TreeNode.new(5)

        result = diameter_of_binary_tree(root)
        expect(result).to eq(3)
    end

    it "should return the correct output for provided example 2" do
        root = TreeNode.new(1)
        # Level 1
        root.left = TreeNode.new(2)

        result = diameter_of_binary_tree(root)
        expect(result).to eq(1)
    end

    it "should return the correct output for a larger binary tree" do
        # https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg
        root = TreeNode.new(1)
        # Level 1
        root.left = TreeNode.new(2)
        root.right = TreeNode.new(3)
        # Level 2
        root.left.left = TreeNode.new(4)
        root.left.right = TreeNode.new(5)
        root.right.left = TreeNode.new(6)
        root.right.right = TreeNode.new(7)
        root.right.right.right = TreeNode.new(8)

        result = diameter_of_binary_tree(root)
        expect(result).to eq(5)
    end

    it "should return the correct output for failing test case" do
        # https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg
        root = TreeNode.new(4)
        # Level 1
        root.left = TreeNode.new(-7)
        root.right = TreeNode.new(-3)
        # Level 2
        root.right.left = TreeNode.new(-9)
        root.right.right = TreeNode.new(-3)
        # Level 3
        root.right.right.left = TreeNode.new(-4)
        root.right.left.left = TreeNode.new(9)
        root.right.left.right = TreeNode.new(-7)
        # Level 4
        root.right.left.left.left = TreeNode.new(6)
        root.right.left.right.left = TreeNode.new(-6)
        root.right.left.right.right = TreeNode.new(-6)
        #Level 5
        root.right.left.right.right.left = TreeNode.new(9)
        root.right.left.right.left.left = TreeNode.new(5)
        root.right.left.left.left.left = TreeNode.new(0)
        root.right.left.left.left.right = TreeNode.new(6)
        # Level 6
        root.right.left.left.left.left.right = TreeNode.new(-1)
        root.right.left.left.left.right.left = TreeNode.new(-4)
        root.right.left.right.right.left.left = TreeNode.new(-2)

        result = diameter_of_binary_tree(root)
        expect(result).to eq(8)
    end
end
