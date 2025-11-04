require_relative './min_val_to_maintain_positive_sum'

describe "#min_start_value" do
    it "should return the correct output for example 1" do
        nums = [-3,2,-3,4,2]
        result = min_start_value(nums)
        expect(result).to eq(5)
    end

    it "should return the correct output for example 2" do
        nums = [1,2]
        result = min_start_value(nums)
        expect(result).to eq(1)
    end


    it "should return the correct output for example 3" do
        nums = [1,-2,-3]
        result = min_start_value(nums)
        expect(result).to eq(5)
    end

    it "should return 1 for any input arrays with all positive values" do
        nums = [2]
        result = min_start_value(nums)
        expect(result).to eq(1)
    end

    it "should return the correct output for all negative values" do
        nums = [-2, -3, -10, -100]
        result = min_start_value(nums)
        expect(result).to eq(116)
    end
end