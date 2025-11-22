require_relative './next_greater_element'

describe "#next_greater_element" do
    it "should return the correct output for provided example 1" do
        nums1 = [4,1,2]
        nums2 = [1,3,4,2]
        result = next_greater_element(nums1, nums2)
        expect(result).to eq([-1,3,-1])
    end

    it "should return the correct output for provided example 1" do
        nums1 = [2,4]
        nums2 = [1,2,3,4]
        result = next_greater_element(nums1, nums2)
        expect(result).to eq([3,-1])
    end
end