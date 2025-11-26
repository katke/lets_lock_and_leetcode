require_relative './min_depth_binary_tree'
require_relative '../helpers/tree_node'

describe "#min_depth" do
    it "should return the correct output for provided example 1" do
        root = TreeNode.new(3)
        root.left = TreeNode.new(9)
        root.right = TreeNode.new(20)

        root.right.left = TreeNode.new(15)
        root.right.right = TreeNode.new(7)
        result = min_depth(root)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 1" do
        root = TreeNode.new(2)
        root.right = TreeNode.new(3)
        root.right.right = TreeNode.new(4)
        root.right.right.right= TreeNode.new(5)
        root.right.right.right.right = TreeNode.new(6)
        result = min_depth(root)
        expect(result).to eq(5)
    end
end