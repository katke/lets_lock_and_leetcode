require_relative './does_path_exist_in_graph'

describe "#valid_path" do
    it "should return the correct output for provided example 1" do
        n = 3
        edges = [[0,1],[1,2],[2,0]]
        source = 0
        destination = 2
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should return the correct output for provided example 2" do
        n = 6
        edges = [[0,1],[0,2],[3,5],[5,4],[4,3]]
        source = 0
        destination = 5
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(false)
    end
end