require_relative "./graph_is_valid_tree"

describe "#valid_tree" do
  it "returns true when it is a valid tree structure" do
    n = 5
    edges = [[0,1],[0,2],[0,3],[1,4]]
    expect(valid_tree(n, edges)).to be(true)
  end

  it "returns false when it is not a valid tree structure" do
    n = 5
    edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
    expect(valid_tree(n, edges)).to be(false)
  end

  it "handles failing test case" do
    n = 4
    edges = [[0,1],[2,3]]
    expect(valid_tree(n, edges)).to be(false)
  end

  it "handles failing test case" do
    n = 2
    edges = [[1,0]]
    expect(valid_tree(n, edges)).to be(true)
  end
end