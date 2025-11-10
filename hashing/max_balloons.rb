# Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.

# You can use each character in text at most once. Return the maximum number of instances that can be formed.

# Constraints:

# 1 <= text.length <= 10^4
# text consists of lower case English letters only.

# Example 1:
# Input: text = "nlaebolko"
# Output: 1

# Example 2:
# Input: text = "loonbalxballpoon"
# Output: 2

# Example 3:
# Input: text = "leetcode"
# Output: 0

# @param {String} text
# @return {Integer}
def max_number_of_balloons(text)
    # create char freq map
    balloon_freq = {b: 1, a: 1, l: 2, o: 2, n: 1}
    supports = {}
    char_freq = {}
    text.chars.each do |c|
        if char_freq[c].nil?
            char_freq[c] = 1
        else
            char_freq[c] = char_freq[c] + 1
        end
    end
    # iterate char by char and check each char freq to see how many times each one could support balloon
    char_freq.keys.each do |c|
        if balloon_freq[c] 
            max = char_freq[c] / balloon_freq[c]
            supports[c] = max
        end
    end
    # make sure we actually have all the characters we need
    balloon_freq.keys.each do |k|
        if char_freq[k].nil?
            return 0
        end
    end
    max_times = 10 ** 4
    # the min num for b, a, l, o, and n will tell us the max number of times we could find it
    supports.each do |c|
        max_times = supports[c] < max_times ? supports[c] : max_times
    end
    max_times
end