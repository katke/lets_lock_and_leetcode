require_relative './max_consecutive_1s_3'

describe "#longest_ones" do
    it "should return the correct output for example 1" do
        nums = [1,1,1,0,0,0,1,1,1,1,0]
        k = 2
        result = longest_ones(nums, k)
        expect(result).to eq(6)
    end

    it "should return the correct output for example 2" do
        nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
        k = 3
        result = longest_ones(nums, k)
        expect(result).to eq(10)
    end

    it "should return the correct output when the longest string is at the beginning" do
        nums = [0,0,1,1,0,1,1,1,1,1,0,0,0,0,0,0,1]
        k = 3
        result = longest_ones(nums, k)
        expect(result).to eq(10)
    end

    it "should return the correct output when the longest string is at the end" do
        nums = [0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,1]
        k = 3
        result = longest_ones(nums, k)
        expect(result).to eq(12)
    end

    it "should return the correct output for all 1s regardless of k" do
        nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        k = 3
        result = longest_ones(nums, k)
        expect(result).to eq(19)
    end

    it "should return the correct output for all 0s" do
        nums = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        k = 5
        result = longest_ones(nums, k)
        expect(result).to eq(5)
    end

    it "should return the correct output for all 0s where k == nums.length" do
        nums = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        k = 19
        result = longest_ones(nums, k)
        expect(result).to eq(19)
    end

    it "should return 0 when k is invalid" do
        nums = [0,0,0,0,1,0,0,0,0,1,0,1,1,0,0,1,1,0,0]
        k = -1
        result = longest_ones(nums, k)
        expect(result).to eq(0)
    end

    it "should return max sequence of 1's when k is 0" do
        nums = [0,0,1,1,1,0,0]
        k = 0
        result = longest_ones(nums, k)
        expect(result).to eq(3)
    end

    it "should return 0 when nums is empty" do
        nums = []
        k = 4
        result = longest_ones(nums, k)
        expect(result).to eq(0)
    end

    it "should return 0 when nums is nil" do
        k = 4
        result = longest_ones(nil, k)
        expect(result).to eq(0)
    end
end