require_relative './closest_bst_val'
require_relative '../helpers/tree_node'

describe "#closest_value" do
    it "should return the correct output for provided example 1" do
        input_root = build_tree_from_arr([4,2,5,1,3])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value(input_root, 3.714286)
        expect(result).to eq(4)
    end

    it "should return the correct output for provided example 2" do
        input_root = build_tree_from_arr([1])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value(input_root, 4.428571)
        expect(result).to eq(1)
    end

    it "should return the smaller val when there are two possible answers" do
        input_root = build_tree_from_arr([4,2,5,1,3])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value(input_root, 3.5)
        expect(result).to eq(3)
    end

    it "should return correct answer for failing test case" do
        input_root = build_tree_from_arr([1,nil,2])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value(input_root, 3.428571)
        expect(result).to eq(2)
    end
end

describe "#closest_value_suboptimal" do
    it "should return the correct output for provided example 1" do
        input_root = build_tree_from_arr([4,2,5,1,3])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value_suboptimal(input_root, 3.714286)
        expect(result).to eq(4)
    end

    it "should return the correct output for provided example 2" do
        input_root = build_tree_from_arr([1])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value_suboptimal(input_root, 4.428571)
        expect(result).to eq(1)
    end

    it "should return the smaller val when there are two possible answers" do
        input_root = build_tree_from_arr([4,2,5,1,3])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value_suboptimal(input_root, 3.5)
        expect(result).to eq(3)
    end

    it "should return correct answer for failing test case" do
        input_root = build_tree_from_arr([1,nil,2])
        puts "input tree:"
        print_tree(input_root)

        result = closest_value_suboptimal(input_root, 3.428571)
        expect(result).to eq(2)
    end
end