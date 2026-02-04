require_relative "./basic_subsets"

describe "#create_unique_subsets" do
  it "results in all unique subsets" do
    result = create_unique_subsets([1,2,3])
    expected = [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
    assert_result_includes_all_expected_combos(expected, result)
  end

  it "handles small inputs correctly" do
    nums = [0]
    result = create_unique_subsets(nums)
    expected = [[],[0]]
    assert_result_includes_all_expected_combos(expected, result)
  end

  it "handles larger inputs correctly" do
    nums = [33,44,55,66]
    result = create_unique_subsets(nums)
    expected = [[],
    [33],
    [44],
    [55],
    [66],
    [33, 44],
    [33, 55],
    [33, 66],
    [44, 55],
    [44, 66],
    [55, 66],
    [33, 44, 55],
    [33, 44, 66],
    [33, 55, 66],
    [44, 55, 66],
    [33, 44, 55, 66]]
    assert_result_includes_all_expected_combos(expected, result)
  end
end

def assert_result_includes_all_expected_combos(expected, result)
  expect(result.length).to eq(expected.length)
  expected.each do |combo|
    expect(result.include?(combo)).to eq(true)
  end
end