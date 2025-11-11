require_relative './max_balloons'

describe "#max_number_of_balloons" do
    it "should return the correct output for provided example 1" do
        text = "nlaebolko"
        result = max_number_of_balloons(text)
        expect(result).to eq(1)
    end

    it "should return the correct output for provided example 2" do
        text = "loonbalxballpoon"
        result = max_number_of_balloons(text)
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 3" do
        text = "leetcode"
        result = max_number_of_balloons(text)
        expect(result).to eq(0)
    end

    it "only counts a full balloon when every char in the word has sufficient available repeats" do
        text = "loonbalxballpoonbaloon" # 1 L short of a 3rd appearance
        result = max_number_of_balloons(text)
        expect(result).to eq(2)
    end

    it "does not count it when one letter is missing" do
        text = "balloo"
        result = max_number_of_balloons(text)
        expect(result).to eq(0)
    end
end