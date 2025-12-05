require_relative './insert_into_binary_tree'
require_relative '../helpers/tree_node'

describe "#insert_into_bst" do
    it "should return the correct output for provided example 1" do
        # https://assets.leetcode.com/uploads/2020/10/05/insertbst.jpg
        # https://assets.leetcode.com/uploads/2020/10/05/bst.jpg
        input_root = TreeNode.new(4)
        # Level 2
        input_root.left = TreeNode.new(2)
        input_root.right = TreeNode.new(7)
        # Level 3
        input_root.left.left = TreeNode.new(1)
        input_root.left.right = TreeNode.new(3)

        
        expected_tree = TreeNode.new(4)
        # Level 2
        expected_tree.left = TreeNode.new(2)
        expected_tree.right = TreeNode.new(7)
        # Level 3
        expected_tree.left.left = TreeNode.new(1)
        expected_tree.left.right = TreeNode.new(3)
        expected_tree.left.right = TreeNode.new(5)
        puts "input:"
        print_tree(input_root)
        puts "expected:"
        print_tree(expected_tree)

        result = insert_into_bst(input_root, 5)
        expect(build_arr_from_tree(result)).to eq([4,2,7,1,3,5])
    end

    it "should return the correct output for provided example 2" do
        input_root = build_tree_from_arr([40,20,60,10,30,50,70])
        puts "input:"
        print_tree(input_root)
        puts "expected:"
        expected_tree = build_tree_from_arr([40,20,60,10,30,50,70,nil,nil,25])
        print_tree(expected_tree)

        result = insert_into_bst(input_root, 25)
        expect(build_arr_from_tree(result)).to eq([40,20,60,10,30,50,70,nil,nil,25])
    end

    it "should return the correct output for provided example 3" do
        input_root = build_tree_from_arr([4,2,7,1,3,nil,nil,nil,nil,nil,nil])
        puts "input:"
        print_tree(input_root)
        puts "expected:"
        expected_tree = build_tree_from_arr([4,2,7,1,3,5])
        print_tree(expected_tree)

        result = insert_into_bst(input_root, 5)
        expect(build_arr_from_tree(result)).to eq([4,2,7,1,3,5])
    end

    it "should make the target val the root when there given a nil root" do

        result = insert_into_bst(nil, 12)
        expect(build_arr_from_tree(result)).to eq([12])
    end
end