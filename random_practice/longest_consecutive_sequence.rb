# Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
#
# You must write an algorithm that runs in O(n) time.
#
#
#
# Example 1:
# Input: nums = [100,4,200,1,3,2]
# Output: 4
# Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  if nums.nil? || nums.empty?
    return 0
  end
  nums_set = Set[]
  streak_count = 1
  max_streak = 0
  nums.each { |num| nums_set.add(num) }
  nums.each do |num|
    is_potential_start_of_sequence = !nums_set.include?(num - 1)
    if is_potential_start_of_sequence
      next_num = num + 1
      while nums_set.include?(next_num) do
        streak_count += 1
        next_num = next_num + 1
      end
      max_streak = [streak_count, max_streak].max
    end
    streak_count = 1
  end
  max_streak
end
