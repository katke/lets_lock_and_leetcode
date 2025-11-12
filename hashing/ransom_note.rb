# Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

# Each letter in magazine can only be used once in ransomNote.

# Constraints:

# 1 <= ransomNote.length, magazine.length <= 105
# ransomNote and magazine consist of lowercase English letters.

# Example 1:
# Input: ransomNote = "a", magazine = "b"
# Output: false

# Example 2:
# Input: ransomNote = "aa", magazine = "ab"
# Output: false

# Example 3:
# Input: ransomNote = "aa", magazine = "aab"
# Output: true

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
# Runtime: O(n + m)
# Space: O(n + m)
def can_construct(ransom_note, magazine)
    note_freq = create_char_freq(ransom_note)
    mag_freq = create_char_freq(magazine)
    note_freq.keys.each do |k|
        if mag_freq[k].nil? || mag_freq[k] < note_freq[k]
            return false
        end
    end
    true
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