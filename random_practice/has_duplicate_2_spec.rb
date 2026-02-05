require_relative "./has_duplicate_2"

describe "#contains_nearby_duplicate" do
  it "returns expected result for provided example 1" do
    nums = [1,2,3,1]
    k = 3
    expect(contains_nearby_duplicate(nums, k)).to be_truthy
  end

  it "returns expected result for provided example 2" do
    nums = [1,0,1,1]
    k = 1
    expect(contains_nearby_duplicate(nums, k)).to be_truthy
  end

  it "returns expected result for provided example 2" do
    nums = [1,2,3,1,2,3]
    k = 2
    expect(contains_nearby_duplicate(nums, k)).to be_falsey
  end
end