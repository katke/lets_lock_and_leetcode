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
# Time: O(2n) => O(n)
# Space: O(n) => kind of O(1) due to limited subset of acceptable chars
def length_of_longest_substring(s)
    if s.nil?
        return 0
    end
    left = 0
    right = 0
    largest_substring = 0
    freq = {}
    while right < s.length do
        right_val = s[right]
        if freq[right_val].nil?
            freq[right_val] = 1
        else
            freq[right_val] = freq[right_val] + 1
        end
        while freq[right_val] > 1 do # this is the key—as long as this character has more than 1, the window is not desirable; shrink from the left until it is again. Once this char drops below 2, the window can be safely assume to be desirable again because we will do this same flow on every char the right pointer touches; there will never be more than one repeating character in the window at any given moment as a result
            left_val = s[left]
            curr_count = freq[left_val]
            if curr_count == 1
                freq.delete(left_val)
            else
                freq[left_val] = curr_count - 1
            end
            left += 1
        end
        if largest_substring < right - left + 1
            largest_substring = right - left + 1
        end
        right += 1
    end
    largest_substring
end