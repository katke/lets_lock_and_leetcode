require_relative './players_with_zero_or_one_losses'

describe "#find_winners" do
    it "should return the correct output for provided example 1" do
        matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]

        result = find_winners(matches)
        expect(result).to eq([[1,2,10],[4,5,7,8]])
    end

    it "should return the correct output for provided example 2" do
        matches = [[2,3],[1,3],[5,4],[6,4]]
        result = find_winners(matches)
        expect(result).to eq([[1,2,5,6],[]])
    end

    it "should return empty array for lossless players if everyone lost at least once" do
        matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9],[9,1],[9,2],[6,10]]
        # {1: 1, 2: 1, 3: 2, 4: 1, 5: 1, 6: 2, 7: 1, 8: 1, 9: 2, 10: 1}
        result = find_winners(matches)
        expect(result).to eq([[],[1,2,4,5,7,8,10]])
    end

    it "should return the correct output for provided example 2" do
        matches = [[200,300]]
        result = find_winners(matches)
        expect(result).to eq([[200],[300]])
    end
end