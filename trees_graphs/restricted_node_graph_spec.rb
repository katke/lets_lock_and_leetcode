require_relative "./restricted_node_graph"

describe "#reachable_nodes" do
    it "returns expected value for provided example 1" do
        n = 7
        edges = [[0,1],[1,2],[3,1],[4,0],[0,5],[5,6]]
        restricted = [4,5]
        result = reachable_nodes(n, edges, restricted)
        expect(result).to eq(4)
    end

    it "returns expected value for provided example 2" do
        n = 7
        edges = [[0,1],[0,2],[0,5],[0,4],[3,2],[6,5]]
        restricted = [4,2,1]
        result = reachable_nodes(n, edges, restricted)
        expect(result).to eq(3)
    end
end