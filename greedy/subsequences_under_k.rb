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