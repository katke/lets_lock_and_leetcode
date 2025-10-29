# Write a function that reverses a string. The input string is given as an array of characters s.
# You must do this by modifying the input array in-place with O(1) extra memory.


# Input: s = ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]

# Input: s = ["H","a","n","n","a","h"]
# Output: ["h","a","n","n","a","H"]

# Constraints:
# 1 <= s.length <= 105
# s[i] is a printable ascii character.

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
    s.reverse!
end