require_relative './counting_elements'

describe "#count_elements" do
    it "should return the correct output for provided example 1" do
        result = count_elements([1,2,3])
        expect(result).to eq(2)
    end

    it "should return the correct output for provided example 2" do
        result = count_elements([1,1,3,3,5,5,7,7])
        expect(result).to eq(0)
    end

    it "should only count freqency when n + 1 exists" do
        result = count_elements([0,0,0,0,0,0,0,0])
        expect(result).to eq(0)
    end

    it "should not factor in n + 1 frequency" do
        result = count_elements([1,1,2])
        expect(result).to eq(2)
    end
end