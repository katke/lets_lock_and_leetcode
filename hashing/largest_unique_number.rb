# # Given an integer array nums, return the largest integer that only occurs once. If no integer occurs once, return -1

# Constraints:

# 1 <= nums.length <= 2000
# 0 <= nums[i] <= 1000

# Example 1:
# Input: nums = [5,7,3,9,4,9,8,3,1]
# Output: 8
# Explanation: The maximum integer in the array is 9 but it is repeated. The number 8 occurs only once, so it is the answer.

# Example 2:
# Input: nums = [9,9,8,8]
# Output: -1
# Explanation: There is no number that occurs only once.

# @param {Integer[]} nums
# @return {Integer}
# Runtime: O(n + n) => O(n)
# space: O(n)
def largest_unique_number(nums)
    freq = {}
    nums.each do |n|
        if freq[n].nil?
            freq[n] = 1
        else
            freq[n] = freq[n] + 1
        end
    end
    max = -1
    freq.keys.each do |k|
        if freq[k] == 1
            max = max > k ? max : k
        end
    end
    max
end