require_relative './squares_sorted_array'

describe "#sorted_squares" do
    it "should return the correct output for example 1" do
        result = sorted_squares([-4,-1,0,3,10])
        expect(result).to eq([0,1,9,16,100])
    end

    it "should return the correct output for example 2" do
        result = sorted_squares([-7,-3,2,3,11])
        expect(result).to eq([4,9,9,49,121])
    end

    it "should handle an empty array" do
        result = sorted_squares([])
        expect(result).to eq([])
    end

    it "should handle an array with many identical values" do
        result = sorted_squares([-1, -1, -1, 1, 1, 2])
        expect(result).to eq([1, 1, 1, 1, 1, 4])
    end

    it "should handle an array with all negative numbers" do
        result = sorted_squares([-10, -7, -3, -2, -1, -1])
        expect(result).to eq([1, 1, 4, 9, 49, 100])
    end

    it "should handle an array with all positive numbers" do
        result = sorted_squares([3, 4, 7, 9, 12])
        expect(result).to eq([9, 16, 49, 81, 144])
    end

    it "should handle nil input" do
        result = sorted_squares(nil)
        expect(result).to be_nil
    end
    
end