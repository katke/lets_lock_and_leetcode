require_relative "./longest_consecutive_sequence"

# Example 1:
#
#   Input: nums = [100,4,200,1,3,2]
# Output: 4
# Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
#   Example 2:
#
#   Input: nums = [0,3,7,2,5,8,4,6,0,1]
# Output: 9
# Example 3:
#
#   Input: nums = [1,0,1,2]
# Output: 3
describe "#longest_consecutive" do
  it "returns expected result for provided ex 1" do
    input = [100,4,200,1,3,2]
    expect(longest_consecutive(input)).to eq(4)
  end

  it "returns expected result for provided ex 2" do
    input = [0,3,7,2,5,8,4,6,0,1]
    expect(longest_consecutive(input)).to eq(9)
  end

  it "returns expected result for provided ex 3" do
    input = [1,0,1,2]
    expect(longest_consecutive(input)).to eq(3)
  end
end