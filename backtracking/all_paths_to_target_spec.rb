require_relative "./all_paths_to_target"

describe "#all_paths_source_target" do
  it "returns expected answer for provided example 1" do
    graph = [[1,2],[3],[3],[]]
    result = all_paths_source_target(graph)
    expected = [[0,1,3],[0,2,3]]
    expect(result).to eq(expected)
  end

  it "returns expected answer for provided example 2" do
    graph = [[4,3,1],[3,2,4],[3],[4],[]]
    result = all_paths_source_target(graph)
    expected = [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
    expect(result).to eq(expected)
  end
end