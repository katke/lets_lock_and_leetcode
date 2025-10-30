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
end