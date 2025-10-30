# Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

# Constraints:

# 1 <= nums.length <= 105
# nums[i] is either 0 or 1.
# 0 <= k <= nums.length

# Example 1:
# Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
# Output: 6
# Explanation: [1,1,1,0,0,1,1,1,1,1,1]
# Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

# Example 2:
# Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
# Output: 10
# Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
# Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def longest_ones(nums, k)
    if k < 1
        return 0
    end
    used_1s = 0
    consec_1s = 0
    max_consecutive_1s = 0
    left = 0
    right = 0
    while right < nums.length
        # check right pointer val
        rightVal = nums[right]
        if rightVal == 0
            if used_1s < k
                used_1s += 1
                consec_1s += 1
                max_consecutive_1s = max_consecutive_1s > consec_1s ? max_consecutive_1s : consec_1s
            end
            while used_1s == k && left < right
                leftVal = nums[left]
                if leftVal == 0
                    consec_1s -= 1
                    used_1s -= 1
                end
                left += 1
            end
        else
            consec_1s += 1
            max_consecutive_1s = max_consecutive_1s > consec_1s ? max_consecutive_1s : consec_1s
        end
        right += 1
        # if 0:
            # if used_1s < k
                # increment used_1s, increment consec 1s
            # else if used_1s == k:
                # while used_1s == k, move left pointer; decrement consec_1s, if left value == 0, decrement used_1s
        # if 1, increment consec_1s
        # increment right pointer
    end
    max_consecutive_1s
end