def two_sum(nums, target)
  puts "nums: #{nums}, target: #{target}"
  if nums.nil? || nums.length < 2
    return []
  end
  val_to_index = {}
  # [1,4,3,3], 6
  # {1:0, 4: 1, 3: 3}
  nums.each_with_index do |num, i|
    val_to_index[num] = i
  end
  nums.each_with_index do |num, i|
    needed_val = target - num
    if val_to_index[needed_val] != i && val_to_index.key?(needed_val)
      return [i, val_to_index[needed_val]]
    end
  end
  []
end