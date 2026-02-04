require_relative "./two_sum"

describe "#two_sum" do
  it "returns correct answer" do
    nums = [2,7,11,15]
    target = 9
    result = two_sum(nums, target)
    expect(result).to eq([0,1])
  end

  it "returns correct answer" do
    nums = [3,2,4]
    target = 6
    result = two_sum(nums, target)
    expect(result).to eq([1,2])
  end

  it "returns correct answer" do
    nums = [3,3]
    target = 6
    result = two_sum(nums, target)
    expect(result).to eq([0,1])
  end
end