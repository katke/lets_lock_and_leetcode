require_relative "./combo_sum_repeating"

describe "#combination_sum" do
  it "returns expected answer for provided ex 1" do
    candidates = [2,3,6,7]
    target = 7
    result = combination_sum(candidates, target)
    expected = [[2,2,3],[7]]
    assert_result_includes_all_expected_combos(expected, result)
  end

  it "returns expected answer for provided ex 2" do
    candidates = [2,3,5]
    target = 8
    result = combination_sum(candidates, target)
    expected = [[2,2,2,2],[2,3,3],[3,5]]
    assert_result_includes_all_expected_combos(expected, result)
  end

  it "returns expected answer for provided ex 3" do
    candidates = [2]
    target = 1
    result = combination_sum(candidates, target)
    expected = []
    assert_result_includes_all_expected_combos(expected, result)
  end
end

def assert_result_includes_all_expected_combos(expected, result)
  expect(result.length).to eq(expected.length)
  expected.each do |combo|
    expect(result.include?(combo)).to eq(true)
  end
end