require_relative './contiguous_binary_array'

describe "#find_max_length" do
    it "should return the correct output for provided example 1" do
        nums = [0,1]
        result = find_max_length(nums)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 2" do
        nums = [0,1,0]
        result = find_max_length(nums)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 3" do
        nums = [0,1,1,1,1,1,0,0,0]
        result = find_max_length(nums)
        expect(result).to eq(6)
    end

    it "should return the correct output when the longest subarray is at the beginning" do
        nums = [1,1,1,1,0,0,0,0,0,0,0,0,0,1]
        result = find_max_length(nums)
        expect(result).to eq(8)
    end

    it "should return 0 when there's only one element in the array" do
        nums = [1]
        result = find_max_length(nums)
        expect(result).to eq(0)
    end

    it "should return 0 when there's only one element in the array" do
        nums = [1]
        result = find_max_length(nums)
        expect(result).to eq(0)
    end

    it "should return 0 when the array has only 1's" do
        nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        result = find_max_length(nums)
        expect(result).to eq(0)
    end

    it "should handle evenly split/alternating arrays" do 
        nums = [0,1,0,1]
        result = find_max_length(nums)
        expect(result).to eq(4)
    end
end