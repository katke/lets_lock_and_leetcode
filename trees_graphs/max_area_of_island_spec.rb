require_relative "./max_area_of_island"

describe "#max_area_of_island" do
    it "returns expected value for provided example 1" do
        grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
        result = max_area_of_island(grid)
        expect(result).to eq(6)
    end

    it "returns expected value for provided example 2" do
        grid = [[0,0,0,0,0,0,0,0]]
        result = max_area_of_island(grid)
        expect(result).to eq(0)
    end
end