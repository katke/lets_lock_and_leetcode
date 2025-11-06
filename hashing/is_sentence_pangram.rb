# A pangram is a sentence where every letter of the English alphabet appears at least once.

# Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.

# Constraints:

# 1 <= sentence.length <= 1000
# sentence consists of lowercase English letters.

# Example 1:
# Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
# Output: true
# Explanation: sentence contains at least one of every letter of the English alphabet.

# Example 2:
# Input: sentence = "leetcode"
# Output: false

# @param {String} sentence
# @return {Boolean}
# Time: O(n)
# Space: O(26) => O(1) [guaranteed only english lowercase letters, max of 26]
def check_if_pangram(sentence)
    if sentence.nil? || sentence.length < 26
        return false
    end
    found_letters = Set[]
    i = 0
    while i < sentence.length do
        curr_char = sentence[i]
        found_letters.add(curr_char)
        i += 1
    end
    found_letters.length == 26
end