require_relative '../reverse_string'

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
end