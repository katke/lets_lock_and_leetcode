# Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

# Constraints:

# 1 <= nums.length <= 10^5
# nums[i] is either 0 or 1.

# Example 1:
# Input: nums = [0,1]
# Output: 2
# Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.

# Example 2:
# Input: nums = [0,1,0]
# Output: 2
# Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

# Example 3:
# Input: nums = [0,1,1,1,1,1,0,0,0]
# Output: 6
# Explanation: [1,1,1,0,0,0] is the longest contiguous subarray with equal number of 0 and 1.

# @param {Integer[]} nums
# @return {Integer}
# def find_max_length(nums)
#     puts "nums: #{nums}"
#     # sliding window: left/right pointers start at 0
#     # move right until/while we meet the cosntraints
#     # once we break the constraints, move left until we meet them again, then start moving right again
#     # start moving right pointer, updating numOf0/numOf1 vars and tracking size of subarray when they are equal
#     # once num0 & num1's are not equal, start moving right pointer until they are or until it reaches the left
#     # then start moving left again
#     right = 0
#     left = 0
#     max_subarray = 0
#     num1s = 0
#     num0s = 0
#     while left < nums.length
#         puts "---right: #{right}, left: #{left}"
#         right_val = nums[right]
#         puts "right_val: #{right_val}"
#         if right_val == 0
#             num0s += 1
#         else
#             num1s += 1
#         end
#         puts "num0s: #{num0s}, num1s: #{num1s}"
#         while num0s == num1s
#             max_subarray = max_subarray > right - left + 1 ? max_subarray : right - left + 1
#             puts "max_subarray: #{max_subarray}"
#             right += 1
#             puts "right: #{right}"
#         end
#         while left < right - 1
#             left_val = nums[left]
#             if left_val == 0
#                 num0s -= 1
#             else
#                 num1s -= 1
#             end
#             left += 1
#         end
#     end
#     max_subarray
# end

def find_max_length(nums)
    puts "nums: #{nums}"
    # sliding window: left/right pointers start at 0
    # move right until/while we meet the cosntraints
    # once we break the constraints, move left until we meet them again, then start moving right again
    # start moving right pointer, updating numOf0/numOf1 vars and tracking size of subarray when they are equal
    # once num0 & num1's are not equal, start moving right pointer until they are or until it reaches the left
    # then start moving left again
    right = 0
    left = 0
    max_subarray = 0
    num1s = 0
    num0s = 0
    if nums.length > 0 # Initialize count with first
        if nums[0] == 0 
            num0s += 1
        else 
            num1s += 1
        end
    end
    while left < nums.length do
        puts "---right: #{right}, left: #{left}"
        puts "window: #{nums.slice(left, right - left + 1)}"
        puts "num0s: #{num0s}, num1s: #{num1s}"
        while num0s != num1s && right < nums.length do
            right += 1
            right_val = nums[right]
            if right_val == 0
                num0s += 1
            else
                num1s += 1
            end
            puts "---right: #{right}, left: #{left}"
            puts "window: #{nums.slice(left, right - left + 1)}"
            puts "num0s: #{num0s}, num1s: #{num1s}"
        end
        if num0s == num1s
            puts "num0s == num1s: true"
            max_subarray = max_subarray > right - left + 1 ? max_subarray : right - left + 1
        end
        if left + 1 > right
            puts "moving right pointer"
            right += 1
        else
            puts "moving left pointer"
            left_val = nums[left]
            if left_val == 0
                num0s -= 1
            else
                num1s -= 1
            end
            left += 1
        end
    end
    max_subarray
end

