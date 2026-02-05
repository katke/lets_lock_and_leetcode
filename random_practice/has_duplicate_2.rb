# Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
#
#
#
#   Example 1:
#
#   Input: nums = [1,2,3,1], k = 3
# Output: true
# Example 2:
# nums = [1,2,3,1,2,3], k = 2
# Output: false

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  if nums.nil?
    return false
  end
  left = 0
  right = 0
  curr_window = Set[]
  # set up initial window of size k
  # update set as we go with values we find
  # if set contains newly added value, we have a dup, return true
  # once window is size k, start sliding both left & right while right < nums.length
  # if we haven't found a dup by then, return false
  while right < k + 1 && right < nums.length
    next_num = nums[right]
    if curr_window.include?(next_num)
      return true
    end
    curr_window << next_num
    right += 1
  end
  right -= 1
  # start sliding whole window now
  while right < nums.length
    curr_left = nums[left]
    curr_window.delete(curr_left)
    left += 1
    right += 1
    new_right = nums[right]
    if curr_window.include?(new_right)
      return true
    end
    curr_window << new_right
  end
  false
end