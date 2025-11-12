require_relative './ransom_note'

describe "#can_construct" do
    it "should return the correct output for provided example 1" do
        ransom_note = "a"
        magazine = "b"
        result = can_construct(ransom_note, magazine)
        expect(result).to eq(false)
    end

    it "should return the correct output for provided example 2" do
        ransom_note = "aa"
        magazine = "ab"
        result = can_construct(ransom_note, magazine)
        expect(result).to eq(false)
    end

    it "should return the correct output for provided example 3" do
        ransom_note = "aa"
        magazine = "aab"
        result = can_construct(ransom_note, magazine)
        expect(result).to eq(true)
    end

    it "should detect when a letter from ransom note isn't present in magazine at all" do
        ransom_note = "aabbbcccddeeee"
        magazine = "aaabbbbccccddd"
        result = can_construct(ransom_note, magazine)
        expect(result).to eq(false)
    end
end