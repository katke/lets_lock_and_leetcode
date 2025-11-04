require_relative './running_sum_1D_arr'

describe "#running_sum" do
    it "should return the correct output for example 1" do
        nums = [1,2,3,4]
        result = running_sum(nums)
        expect(result).to eq([1,3,6,10])
    end

    it "should return the correct output for example 2" do
        nums = [1,1,1,1,1]
        result = running_sum(nums)
        expect(result).to eq([1,2,3,4,5])
    end

    it "should return the correct output for example 3" do
        nums = [3,1,2,10,1]
        result = running_sum(nums)
        expect(result).to eq([3,4,6,16,17])
    end

    it "should sum negative numbers correctly" do
        nums = [1,-1,1,-10,-100]
        result = running_sum(nums)
        expect(result).to eq([1,0,1,-9,-109])
    end

    it "should sum array with one value correctly" do
        nums = [-5]
        result = running_sum(nums)
        expect(result).to eq([-5])
    end

    it "should handle empty array" do
        result = running_sum([])
        expect(result).to eq([])
    end
end