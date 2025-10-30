# You are given an integer array nums consisting of n elements, and an integer k.

# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

# Constraints:

# n == nums.length
# 1 <= k <= n <= 105
# -104 <= nums[i] <= 104

# Example 1:
# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

# Example 2:
# Input: nums = [5], k = 1
# Output: 5.00000

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
# Runtime: O(n)
# Space: O(1)
def find_max_average(nums, k)
    if nums.nil? || k.nil? || nums.length < k
        return 0
    end
    maxAvg = -Float::INFINITY
    currWindowAvg = -Float::INFINITY
    right = 0
    left = 0
    currWindowSum = 0

    while right < nums.length do
        currWindowSum += nums[right]
        if right >= k - 1
            currWindowAvg = currWindowSum.to_f / k
            maxAvg = maxAvg > currWindowAvg ? maxAvg : currWindowAvg
            currWindowSum -= nums[left]
            left += 1
        end
        right += 1
    end
   maxAvg
end