def find_valid_combinations(nums, target)
  result = []
  # we need to sort nums to ensure that we can make inferences about current sums and whether we should keep going down the current path
  try_next_element(0, nums.sort, 0, target, [], result)
  result
end

def try_next_element(start_idx, nums, curr_sum, target, curr_combo, result)
  if curr_sum == target
    # we're done, push a copy of the arr so that when this current reference gets emptied out when we pop off
    # unsuccessful candidates later on, it doesn't affect the results
    result.push(curr_combo.dup)
    return
  end
  (start_idx...nums.length).each { |i|
    # ensure we pick up from where we left off to prevent duplicates
    num = nums[i]
    if curr_sum + num > target
      # because we sorted nums, can we safely assume that if we've gone over the target at this point, this path is now a dead end
      break
    else
      # we're going to continue down this path and see what's next
      curr_combo.push(num)
      try_next_element(i + 1, nums, curr_sum + num, target, curr_combo, result)
      # the recursive function has now return; we either found our target or went beyond it
      # either way, remove the last thing we added so we can try something new on the next iteration
      curr_combo.pop
    end
  }
end