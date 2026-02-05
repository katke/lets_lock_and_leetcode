require_relative "./palindromic_strings"

describe "#count_substrings" do
  it "returns expected result for ex 1" do
    s = "abc"
    expect(count_substrings(s)).to eq(3) # expected: "a", "b", "c"
  end

  it "returns expected result for ex 2" do
    s = "aaa"
    expect(count_substrings(s)).to eq(6) # expected: "a", "a", "a", "aa", "aa", "aaa"
  end
end