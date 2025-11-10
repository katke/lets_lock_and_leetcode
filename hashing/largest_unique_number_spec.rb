require_relative './largest_unique_number'

describe "#largest_unique_number" do
    it "should return the correct output for provided example 1" do
        nums = [5,7,3,9,4,9,8,3,1]
        result = largest_unique_number(nums)
        expect(result).to eq(8)
    end

    it "should return the correct output for provided example 2" do
        nums = [9,9,8,8]
        result = largest_unique_number(nums)
        expect(result).to eq(-1)
    end

    it "should return the correct output" do
        nums = [1,4,4,4,4,4,4,9,9,9,9,100,100]
        result = largest_unique_number(nums)
        expect(result).to eq(1)
    end

    it "should handle negative integers correctly" do
        nums = [0,10,10,100,100]
        result = largest_unique_number(nums)
        expect(result).to eq(0)
    end
end