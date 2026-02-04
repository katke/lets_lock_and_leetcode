# Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
#
#   The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
#
#   The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
# Constraints:
#
# 1 <= candidates.length <= 30
# 2 <= candidates[i] <= 40
# All elements of candidates are distinct.
# 1 <= target <= 40
def combination_sum(candidates, target)
  puts "candidates: #{candidates}, target: #{target}"
  result = []
  backtrack(0, [], 0, candidates, target, result)
  result
end

def backtrack(curr_sum, curr_combo, start_index, candidates, target, result)
  puts "backtrack() curr_sum #{curr_sum}, curr_combo #{curr_combo}, start_index: #{start_index}"
  if curr_sum == target
    result << curr_combo.dup
    return
  elsif curr_sum > target
    return
  end
  (start_index...candidates.length).each do |index|
    # puts "index: #{index}"
    curr_combo << candidates[index]
    backtrack(curr_sum + candidates[index], curr_combo, index, candidates, target, result)
    puts "backtracking, removing #{candidates[index]}"
    curr_combo.pop
  end
end