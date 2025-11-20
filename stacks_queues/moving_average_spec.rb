require_relative("./moving_average")

describe "MovingAverage" do
    it "handles provided example as expected" do
        obj = MovingAverage.new(3)
        expect(obj.next(1)).to eq(1.0)
        expect(obj.next(10)).to eq(5.5)
        expect(obj.next(3)).to eq(4.666666666666667)
        expect(obj.next(5)).to eq(6.0)
    end
end