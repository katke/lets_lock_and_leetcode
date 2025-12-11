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

    it "should still find the valid path when it is several layers deep" do
        n = 8
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        source = 0
        destination = 4
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should not find a valid path when source and destination are parts of disconnected graphs" do
        n = 8
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        source = 0
        destination = 7
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(false)
    end

    it "should find a valid path when destination and source node are the same" do
        n = 1
        edges = []
        source = 0
        destination = 0
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should not find a valid path when there are no edges" do
        n = 8
        edges = []
        source = 0
        destination = 4
        result = valid_path(n, edges, source, destination)
        expect(result).to eq(false)
    end
end

describe "#valid_path_recursive" do
    it "should return the correct output for provided example 1" do
        n = 3
        edges = [[0,1],[1,2],[2,0]]
        source = 0
        destination = 2
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should return the correct output for provided example 2" do
        n = 6
        edges = [[0,1],[0,2],[3,5],[5,4],[4,3]]
        source = 0
        destination = 5
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(false)
    end

    it "should still find the valid path when it is several layers deep" do
        n = 8
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        source = 0
        destination = 4
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should not find a valid path when source and destination are parts of disconnected graphs" do
        n = 8
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        source = 0
        destination = 7
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(false)
    end

    it "should find a valid path when destination and source node are the same" do
        n = 1
        edges = []
        source = 0
        destination = 0
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(true)
    end

    it "should not find a valid path when there are no edges" do
        n = 8
        edges = []
        source = 0
        destination = 4
        result = valid_path_recursive(n, edges, source, destination)
        expect(result).to eq(false)
    end
end