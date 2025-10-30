require_relative './max_avg_subarray_1'

describe "#find_max_average" do
    it "should return the correct output for example 1" do
        nums = [1,12,-5,-6,50,3]
        k = 4
        result = find_max_average(nums, k)
        expect(result).to eq(12.75000)
    end

    it "should return the correct output for example 2" do
        nums = [5]
        k = 1
        result = find_max_average(nums, k)
        expect(result).to eq(5.00000)
    end

    it "should handle empty array input" do # technically not allowed based on constraints but for good measure...
        nums = []
        k = 1
        result = find_max_average(nums, k)
        expect(result).to eq(0)
    end

    it "should correctly calculate/compare avg when all values negative" do
        nums = [-1, -2, -3, -300, -123, -1000]
        k = 3
        result = find_max_average(nums, k)
        expect(result).to eq(-2)
    end

    it "should correctly handle larger case where k == nums.length" do
        nums = [3, 4, 5, 6, 7, 8, 9]
        k = 7
        result = find_max_average(nums, k)
        expect(result).to eq(6)
    end

    it "should correctly handle larger case where k == 1" do
        nums = [4, 5, 136, 44, 97, 22, 10285, 3]
        k = 1
        result = find_max_average(nums, k)
        expect(result).to eq(10285)
    end

    it "should correctly handle larger case where k == 1 and largest average is first value" do
        nums = [819, 4, 5, 136, 44, 97, 22, 10, 3]
        k = 1
        result = find_max_average(nums, k)
        expect(result).to eq(819)
    end

    it "should handle nil nums input" do
        nums = nil
        k = 3
        result = find_max_average(nums, k)
        expect(result).to eq(0)
    end

    it "should handle nil k input" do
        nums = nil
        k = nil
        result = find_max_average(nums, k)
        expect(result).to eq(0)
    end
end