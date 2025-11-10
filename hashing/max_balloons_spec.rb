require_relative './max_balloons'

describe "#max_number_of_balloons" do
    it "should return the correct output for provided example 1" do
        text = "nlaebolko"
        result = max_number_of_balloons(text)
        expect(result).to eq(1)
    end
end