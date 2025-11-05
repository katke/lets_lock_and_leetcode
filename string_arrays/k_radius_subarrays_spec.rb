require_relative './k_radius_subarrays'

describe "#get_averages" do
    it "should return the correct output for example 1" do
        nums = [7,4,3,9,1,8,5,2,6]
        k = 3
        result = get_averages(nums, k)
        expect(result).to eq([-1,-1,-1,5,4,4,-1,-1,-1])
    end

    it "should return the correct output for example 2" do
        nums = [100000]
        k = 0
        result = get_averages(nums, k)
        expect(result).to eq([100000])
    end
    

    it "should return the correct output for example 3" do
        nums = [8]
        k = 100000
        result = get_averages(nums, k)
        expect(result).to eq([-1])
    end

    it "should return the correct output for k = 1" do
        nums = [8, 3, 4, 2]
        k = 1
        result = get_averages(nums, k)
        expect(result).to eq([-1, 5, 3, -1])
    end

    it "should return all -1's when k is invalid" do
        nums = [8, 3, 4, 2]
        k = -1
        result = get_averages(nums, k)
        expect(result).to eq([-1, -1, -1, -1])
    end

    it "should return an empty array when nums is empty" do
        nums = []
        k = 3
        result = get_averages(nums, k)
        expect(result).to eq([])
    end
end