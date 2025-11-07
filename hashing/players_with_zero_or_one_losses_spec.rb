require_relative './counting_elements'

describe "#find_winners" do
    it "should return the correct output for provided example 1" do
        matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
        result = find_winners(matches)
        expect(result).to eq([[1,2,10],[4,5,7,8]])
    end

    it "should return the correct output for provided example 1" do
        matches = [[2,3],[1,3],[5,4],[6,4]]
        result = find_winners(matches)
        expect(result).to eq([[1,2,5,6],[]])
    end
end