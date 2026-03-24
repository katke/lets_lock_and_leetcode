# You are given an integer array nums and an integer k. You may partition nums into one or more subsequences such that each element in nums appears in exactly one of the subsequences.
#
#   Return the minimum number of subsequences needed such that the difference between the maximum and minimum values in each subsequence is at most k.
#
#   A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.
#
#
#
# Example 1:
#
# Input: nums = [3,6,1,2,5], k = 2
# Output: 2

def partition_array(nums, k)
  nums.sort!
  result = 1
  start = nums[0]

  (1...nums.size).each do |i|
    # starting from lowest val (thanks to sort), absorb as many values as you can before starting next subsequence
    puts "nums[i] #{nums[i]}, start: #{start}"
    puts "diff #{nums[i] - start}"
    puts "nums[i] - start > k: #{nums[i] - start > k}"
    if nums[i] - start > k
      start = nums[i]
      result += 1
    end
  end
    result
end