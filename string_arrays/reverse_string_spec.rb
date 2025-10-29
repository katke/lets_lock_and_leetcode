require_relative './reverse_string'

describe "#reverse_string" do
    it "should return the correct output for example 1" do
        s = ["h","e","l","l","o"]
        reverse_string(s)
        expect(s).to eq(["o","l","l","e","h"])
    end

    it "should return the correct output for example 2" do
        s = ["H","a","n","n","a","h"]
        reverse_string(s)
        expect(s).to eq(["h","a","n","n","a","H"])
    end

    it "handle longer non-repeating string value" do
        s = ["a", "r", "p", "o", "s", "t", "#", "!", "z", "x"]
        reverse_string(s)
        expect(s).to eq(["x", "z", "!", "#", "t", "s", "o", "p", "r", "a"])
    end

    it "should handle empty char array input" do
        s = []
        reverse_string(s)
        expect(s).to eq([])
    end

    it "should handle empty char array input" do
        s = []
        reverse_string(s)
        expect(s).to eq([])
    end

    it "should handle single char array input" do
        s = ["s"]
        reverse_string(s)
        expect(s).to eq(["s"])
    end
end