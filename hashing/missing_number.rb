# Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

# Example 1:
# Input: nums = [3,0,1]
# Output: 2

# Explanation:
# n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

# Constraints:

# n == nums.length
# 1 <= n <= 104
# 0 <= nums[i] <= n
# All the numbers of nums are unique.
 

# Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

# @param {Integer[]} nums
# @return {Integer}
# Runtime: O(n)
# Space: O(1)
def missing_number(nums)
 if nums.nil?
        return 0
    end
    expected_sum = 0
    actual_sum = 0
    nums.each_with_index do |n,i|
        expected_sum += i
        actual_sum += n
    end
    expected_sum += nums.length # since max val will be the size of the array, but we're one iteration short of that
    expected_sum - actual_sum
end

# Runtime: O(2n) => O(n)
# Space: O(n)
def missing_number_less_space_efficient(nums)
    if nums.nil?
        return 0
    end
    max_val = nums.length
    nums_map = {}
    nums.each_with_index do |n,i| 
        nums_map[n] = i
    end
    max_val.times do |n|
        if nums_map[n].nil?
            return n
        end
    end
    return max_val
end