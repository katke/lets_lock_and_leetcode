# Given a string s, find the length of the longest substring without duplicate characters.

# Constraints:

# 0 <= s.length <= 5 * 104
# s consists of English letters, digits, symbols and spaces.

# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.

# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    if s.nil?
        return 0
    end
    left = 0
    right = 0
    largest_substring = 0
    freq = {}
    while left < s.length do
        right_val = s[right]
        if freq[right_val].nil?
            freq[right_val] = 1
        else
            freq[right_val] = freq[right_val] + 1
        end
        puts "in top level while, left: #{left}, right: #{right}"
        puts "freq: #{freq}"
        while freq.keys.length == right - left + 1 && left = right do
            puts "---in inner while, left: #{left}, right: #{right}"
            largest_substring = largest_substring < left - right + 1 ? left - right + 1 : largest_substring
            puts "largest_substring: #{largest_substring}"
            left_val = freq[left]
            curr_count = freq[left_val]
            if curr_count == 1
                freq.remove(left_val)
            else
                freq[left_val] = curr_count - 1
            end
            left += 1
            puts "freq: #{freq}"
        end
        if right == s.length - 1
            left_val = freq[left]
            curr_count = freq[left_val]
            if curr_count == 1
                freq.remove(left_val)
            else
                freq[left_val] = curr_count - 1
            end
            left += 1
        else
            right += 1
        end
    end
    largest_substring
end