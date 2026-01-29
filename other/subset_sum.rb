def find_valid_combinations(nums, target)
  result = []
  try_next_element(0, nums.sort, 0, target, [], result)
  result
end

def try_next_element(start_idx, nums, curr_sum, target, curr_combo, result)
  if curr_sum == target
    result.push(curr_combo.dup)
    return
  elsif start_idx >= nums.length
    return
  end
  (start_idx..nums.length - 1).each_with_index { |i|
    num = nums[i]
    if curr_sum + num > target
      return
    else
      curr_combo.push(num)
      try_next_element(i + 1, nums, curr_sum + num, target, curr_combo, result)
      curr_combo.pop
    end
  }
end