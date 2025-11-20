require_relative './make_string_good'

describe "#make_good" do
    it "should return the correct output for provided example 1" do
        s = "leEeetcode"
        result = make_good(s)
        expect(result).to eq("leetcode")
    end

    it "should return the correct output for provided example 1" do
        s = "abBAcC"
        result = make_good(s)
        expect(result).to eq("")
    end

    it "should return the correct output for provided example 1" do
        s = "s"
        result = make_good(s)
        expect(result).to eq("s")
    end

    it "should return the correct output for provided example 1" do
        s = "leEeetcodeEDaa"
        result = make_good(s)
        expect(result).to eq("leetcoaa")
    end
end