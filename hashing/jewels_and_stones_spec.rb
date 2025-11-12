require_relative './jewels_and_stones'

describe "#num_jewels_in_stones" do
    it "should return the correct output for provided example 1" do
        jewels = "aA"
        stones = "aAAbbbb"
        result = num_jewels_in_stones(jewels, stones)
        expect(result).to eq(3)
    end

    it "should return the correct output for provided example 2" do
        jewels = "z"
        stones = "ZZ"
        result = num_jewels_in_stones(jewels, stones)
        expect(result).to eq(0)
    end

    it "should return the correct output" do
        jewels = "abcdefgABC"
        stones = "ABCDEFGhijklmnopabcccccccccccccccc"
        result = num_jewels_in_stones(jewels, stones)
        expect(result).to eq(21)
    end
end