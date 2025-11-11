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
# Runtime: O(7 + n + 26 + 5) => O(38 + 2n) => O(n) 
# Space: O(26 + 5) => O(1) 
def max_number_of_balloons(text)
    # create char freq map from input text
    balloon_freq = create_char_freq("balloon")
    max_char_avail = {}
    input_freq = create_char_freq(text)
    # iterate char by char and check each char freq to see how many times each one could support balloon
    input_freq.keys.each do |c|
        # we only care about chars present in balloon, and if the string has at least the min number of chars to complete the word at least once
        if balloon_freq[c] 
            if input_freq[c] < balloon_freq[c]
                return 0
            end
            max = input_freq[c] / balloon_freq[c]
            max_char_avail[c] = max
        end
    end
    # make sure we actually have all the characters we need
    unless max_char_avail.keys.length == 5
        return 0
    end
    min_times = 10 ** 4
    # the min num for b, a, l, o, and n will tell us the max number of times we could find the full word, i.e. even if we have enough b's, a's, l's, and o's for five appearances, if we only have enough n's for once, then we can only find the word one time
    max_char_avail.keys.each do |c|
        min_times = max_char_avail[c] < min_times ? max_char_avail[c] : min_times
    end
    min_times
end

def create_char_freq(text)
    input_freq = {}
    text.chars.each do |c|
        if input_freq[c].nil?
            input_freq[c] = 1
        else
            input_freq[c] = input_freq[c] + 1
        end
    end
    input_freq
end