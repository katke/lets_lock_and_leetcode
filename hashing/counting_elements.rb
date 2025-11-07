# Given an integer array arr, count how many elements x there are, such that x + 1 is also in arr. If there are duplicates in arr, count them separately.

# Constraints:

# 1 <= arr.length <= 1000
# 0 <= arr[i] <= 1000

# Example 1:
# Input: arr = [1,2,3]
# Output: 2
# Explanation: 1 and 2 are counted cause 2 and 3 are in arr.

# Example 2:
# Input: arr = [1,1,3,3,5,5,7,7]
# Output: 0
# Explanation: No numbers are counted, cause there is no 2, 4, 6, or 8 in arr.

# @param {Integer[]} arr
# @return {Integer}
# Runtime: O(2n) => O(n)
# Space: O(n)
def count_elements(arr)
    if arr.nil?
        return 0
    end
    # build frequency hashmap
    freq = {}
    arr.each do |n|
        if freq[n].nil?
            freq[n] = 1
        else
            curr_count = freq[n]
            freq[n] = curr_count + 1
        end
    end
    # iterate through map; check each key and see if key + 1 exists
    # if yes, count it. Check frequency of key vs key + 1 to see how many times it should be counted
    # if no, don't count it
    count = 0
    freq.keys.each do |k|
        curr_int_count = freq[k]
        next_key_count = freq[k + 1]
        unless next_key_count.nil?
            count += curr_int_count
        end
    end
    count
end
