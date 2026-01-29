require_relative "./subset_sum"

describe "#find_valid_combinations" do
  it "finds all valid subsets that add up to the target" do
    target = 8
    nums = [1,2,2,3,5,8]
    result = find_valid_combinations(nums, target)
    expected = [[8],[3,5],[1,2,2,3],[1,2,2,3],[1,2,5]]
    expect(result.length).to eq(expected.length)
    expected.each do |ex|
      expect(result.include?(ex)).to eq(true)
    end
  end

  it "incorporates negative numbers" do
    target = 8
    nums = [-1,1,4,5,8]
    result = find_valid_combinations(nums, target)
    expected = [[8],[-1,4,5],[-1,1,8]]
    expect(result.length).to eq(expected.length)
    expected.each do |ex|
      expect(result.include?(ex)).to eq(true)
    end
  end
end