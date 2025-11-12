# You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

# Letters are case sensitive, so "a" is considered a different type of stone from "A".

# Constraints:

# 1 <= jewels.length, stones.length <= 50
# jewels and stones consist of only English letters.
# All the characters of jewels are unique.

# Example 1:
# Input: jewels = "aA", stones = "aAAbbbb"
# Output: 3

# Example 2:
# Input: jewels = "z", stones = "ZZ"
# Output: 0

# @param {String} jewels
# @param {String} stones
# @return {Integer}
# Runtime: O(j + s) => arguably O(s) since jewels is guaranteed to be unique chars and bounded by upper/lowercase english letters, so j can be considered constant
# Space: O(j) => same argument for O(1)
def num_jewels_in_stones(jewels, stones)
    jewels_set = Set[]
    stones_map = {}
    total_jewels = 0
    jewels.chars.each do |j|
        jewels_set.add(j)
    end
    stones.chars.each do |s|
        if jewels_set.include?(s)
            total_jewels += 1
        end
    end
    total_jewels
end

