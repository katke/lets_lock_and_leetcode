require_relative './longest_substring_no_repeating_chars'

describe "#length_of_longest_substring" do
    it "should return the correct output for provided example 1" do
        s = "abcabcbb"
        result = length_of_longest_substring(s)
        expect(result).to eq(3)
    end

    it "should return the correct output for provided example 2" do
        s = "bbbbb"
        result = length_of_longest_substring(s)
        expect(result).to eq(1)
    end

    it "should return the correct output for provided example 3" do
        s = "pwwkew"
        result = length_of_longest_substring(s)
        expect(result).to eq(3)
    end

    it "should handle spaces" do
        s = "aa cd"
        result = length_of_longest_substring(s)
        expect(result).to eq(4)
    end

    it "should handle empty string input" do
        s = ""
        result = length_of_longest_substring(s)
        expect(result).to eq(0)
    end

    it "should return correct output" do
        s = "aaaaaabacdefgaaa"
        result = length_of_longest_substring(s)
        expect(result).to eq(7)
    end

    it "should return correct output when longest substring is at the beginning" do
        s = "acdefgaabaaaaacaaaaaa"
        result = length_of_longest_substring(s)
        expect(result).to eq(6)
    end

    it "should return correct output when longest substring is at the end" do
        s = "aaacaaabaaadaacdefgh"
        result = length_of_longest_substring(s)
        expect(result).to eq(7)
    end
    
end