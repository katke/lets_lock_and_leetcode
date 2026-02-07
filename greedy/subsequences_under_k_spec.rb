require_relative "./subsequences_under_k"

describe "#partition_array" do
  it "does the thing" do
    nums = [3,6,1,2,5]
    k = 2
    result = partition_array(nums, k)
    expect(result).to eq(2)
  end

  it "does the thing" do
    nums = [3,6,1,2,5,9]
    k = 2
    result = partition_array(nums, k)
    expect(result).to eq(3)
  end

  it "does the thing" do
    nums = [33,66,11,22,55,19]
    k = 200
    result = partition_array(nums, k)
    expect(result).to eq(1)
  end

  it "does the thing" do
    nums = [10, 7, 14, 20, 3, -5]
    k = 2
    result = partition_array(nums, k)
    expect(result).to eq(6)
  end
end