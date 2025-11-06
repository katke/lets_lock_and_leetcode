require_relative './is_sentence_pangram'

describe "#check_if_pangram" do
    it "should return the correct output for provided example 1" do
        sentence = "thequickbrownfoxjumpsoverthelazydog"
        result = check_if_pangram(sentence)
        expect(result).to be(true)
    end

    it "should return the correct output for provided example 2" do
        sentence = "leetcode"
        result = check_if_pangram(sentence)
        expect(result).to be(false)
    end

    it "should handle duplicate letters" do
        sentence = "thequickbrownfoxjumpsoverthelazydogthequickbrownfoxjumpsoverthelazydog"
        result = check_if_pangram(sentence)
        expect(result).to be(true)
    end

    it "should handle empty sentence" do
        sentence = ""
        result = check_if_pangram(sentence)
        expect(result).to be(false)
    end

    it "should handle 25 accounted for letters" do
        sentence = "thequickbrownfoxjumpsoverthelazydo"
        result = check_if_pangram(sentence)
        expect(result).to be(false)
    end
end