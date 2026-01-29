require_relative("./all_valid_parens")

describe "#all_valid_parens" do
  it "finds all possible valid combinations given n pairs of parens" do
    result = all_valid_parens(3)
    puts "result #{result}"
    expected = %w[((())) (()()) (())() ()(()) ()()()]
    expect(result.length).to eq(expected.length)
    expected.each do |paren_combo|
      expect(result.include?(paren_combo))
    end
  end
end