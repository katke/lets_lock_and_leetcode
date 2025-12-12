require_relative("./num_connected_components")

describe "#count_components" do
    it "returns expected output for provided example 1" do
        n = 5
        edges = [[0,1],[1,2],[3,4]]
        result = count_components(n, edges)
        expect(result).to eq(2)
    end

    it "returns expected output for provided example 2" do
        n = 5
        edges = [[0,1],[1,2],[2,3],[3,4]]
        result = count_components(n, edges)
        expect(result).to eq(1)
    end

    it "still accounts for components with no edges to other components" do
        n = 10
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        result = count_components(n, edges)
        expect(result).to eq(3)
    end
end

describe "#count_components_recursive" do
    it "returns expected output for provided example 1" do
        n = 5
        edges = [[0,1],[1,2],[3,4]]
        result = count_components_recursive(n, edges)
        expect(result).to eq(2)
    end

    it "returns expected output for provided example 2" do
        n = 5
        edges = [[0,1],[1,2],[2,3],[3,4]]
        result = count_components_recursive(n, edges)
        expect(result).to eq(1)
    end

    it "still accounts for components with no edges to other components" do
        n = 10
        edges = [[0,1],[1,2],[2,5],[2,3],[3,5],[3,4],[5,6],[7,8]]
        result = count_components_recursive(n, edges)
        expect(result).to eq(3)
    end
end