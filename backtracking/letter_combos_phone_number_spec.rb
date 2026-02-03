require_relative "./letter_combos_phone_number"

describe "#letter_mapping_iterative" do
  it "does the thing" do
    digits = "23"
    result = letter_mapping_iterative(digits)
    puts "result: #{result}"
    expected = %w[ad ae af bd be bf cd ce cf]
    expect(result.length).to eq(expected.length)
    result.each do |perm|
      expect(expected.include?(perm)).to eq(true)
    end
  end
end

describe "#letter_mapping_recursive" do
  it "does the thing" do
    digits = "23"
    result = letter_mapping_recursive(digits)
    puts "result: #{result}"
    expected = %w[ad ae af bd be bf cd ce cf]
    expect(result.length).to eq(expected.length)
    result.each do |perm|
      expect(expected.include?(perm)).to eq(true)
    end
  end
end

describe "#letter_mapping_backtracking" do
  it "does the thing" do
    digits = "23"
    result = letter_mapping_backtracking(digits)
    expected = %w[ad ae af bd be bf cd ce cf]
    expect(result.length).to eq(expected.length)
    result.each do |perm|
      expect(expected.include?(perm)).to eq(true)
    end
  end
end