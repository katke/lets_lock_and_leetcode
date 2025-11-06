require_relative './missing_number'

describe "#missing_number" do
    it "should return the correct output for provided example 1" do
        nums = [3,0,1]
        result = missing_number(nums)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 2" do
        nums = [0,1]
        result = missing_number(nums)
        expect(result).to eq(2)
    end
    
    it "should return the correct output for provided example 3" do
        nums = [9,6,4,2,3,5,7,0,1,8]
        result = missing_number(nums)
        expect(result).to eq(10)
    end

    it "should recognize when 0 is missing" do
        nums = [6,4,2,3,5,7,9,1,8]
        result = missing_number(nums)
        expect(result).to eq(0)
    end

    it "should return 0 when nums is empty" do
        nums = []
        result = missing_number(nums)
        expect(result).to eq(0)
    end
end

describe "#missing_number_less_space_efficient" do
    it "should return the correct output for provided example 1" do
        nums = [3,0,1]
        result = missing_number_less_space_efficient(nums)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 2" do
        nums = [0,1]
        result = missing_number_less_space_efficient(nums)
        expect(result).to eq(2)
    end
    
    it "should return the correct output for provided example 3" do
        nums = [9,6,4,2,3,5,7,0,1,8]
        result = missing_number_less_space_efficient(nums)
        expect(result).to eq(10)
    end

    it "should recognize when 0 is missing" do
        nums = [6,4,2,3,5,7,9,1,8]
        result = missing_number_less_space_efficient(nums)
        expect(result).to eq(0)
    end

    it "should return 0 when nums is empty" do
        nums = []
        result = missing_number_less_space_efficient(nums)
        expect(result).to eq(0)
    end
end