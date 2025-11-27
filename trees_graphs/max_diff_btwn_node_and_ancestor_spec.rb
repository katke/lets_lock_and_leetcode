require_relative './max_diff_btwn_node_and_ancestor'
require_relative '../helpers/tree_node'

describe "#max_ancestor_diff" do
    it "should return the correct output for provided example 1" do
        root = TreeNode.new(8)
        # Level 1
        root.left = TreeNode.new(3)
        root.right = TreeNode.new(10)
        # Level 2
        root.left.left = TreeNode.new(1)
        root.left.right = TreeNode.new(6)
        root.right.right = TreeNode.new(14)
        # Level 3
        root.left.right.left = TreeNode.new(4)
        root.left.right.right = TreeNode.new(7)
        root.right.right.left = TreeNode.new(13)

        result = max_ancestor_diff(root)
        expect(result).to eq(7)
    end

    it "should return the correct output for provided example 2" do
        root = TreeNode.new(1)
        root.right = TreeNode.new(2)
        root.right.right = TreeNode.new(0)
        root.right.right.left= TreeNode.new(3)
        result = max_ancestor_diff(root)
        expect(result).to eq(3)
    end
end

describe "#max_ancestor_diff_brute_force" do
    it "should return the correct output for provided example 1" do
        root = TreeNode.new(8)
        # Level 1
        root.left = TreeNode.new(3)
        root.right = TreeNode.new(10)
        # Level 2
        root.left.left = TreeNode.new(1)
        root.left.right = TreeNode.new(6)
        root.right.right = TreeNode.new(14)
        # Level 3
        root.left.right.left = TreeNode.new(4)
        root.left.right.right = TreeNode.new(7)
        root.right.right.left = TreeNode.new(13)

        result = max_ancestor_diff_brute_force(root)
        expect(result).to eq(7)
    end

    it "should return the correct output for provided example 2" do
        root = TreeNode.new(1)
        root.right = TreeNode.new(2)
        root.right.right = TreeNode.new(0)
        root.right.right.left= TreeNode.new(3)
        result = max_ancestor_diff_brute_force(root)
        expect(result).to eq(3)
    end
end