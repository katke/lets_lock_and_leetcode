def create_unique_subsets(nums)
  puts "nums: #{nums}"
  puts "------------"
  subsets = []
  backtrack(nums, 0, [], subsets)
  puts "subsets: #{subsets}"
  subsets
end

def backtrack(nums, start_index, curr_subset, result)
  puts "backtrack() curr_subset: #{curr_subset}, start_index: #{start_index}"
  result << curr_subset.dup
  (start_index...nums.length).each do |nums_index|
    puts "new num: #{nums[nums_index]}"
    curr_subset << nums[nums_index]
    backtrack(nums, nums_index + 1, curr_subset, result)
    puts "backtracking, removing #{nums[nums_index]}"
    curr_subset.pop
  end
end