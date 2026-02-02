require_relative './reverse_grouped_string'

describe "#reverse_grouped_string" do
  it "does the thing" do
    result = reverse_grouped_string("ten eleven twelve")
    expect(result).to eq("twelve eleven ten")
  end
end

describe "#reverse_grouped_string_no_constraints" do
  it "does the thing" do
    result = reverse_grouped_string_no_constraints("ten eleven twelve")
    expect(result).to eq("twelve eleven ten")
  end
end