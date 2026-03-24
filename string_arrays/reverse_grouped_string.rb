def reverse_words_inplace(string)
  left = 0
  right = string.length - 1
  while left < right do
    left_char = string[left]
    right_char = string[right]
    string[right] = left_char
    string[left] = right_char
    left += 1
    right -= 1
  end
  right = 0
  left = 0
  while right < string.length do
    if string[right] == " " || right == string.length - 1
      left = right
      while string[right] == " " || right == string.length - 1
        right += 1
      end
      reverse_word_inplace(string, left, right)
      left = right
    end
  end
  string
end

def reverse_word_inplace(string, left, right)
  while left < right
    left_char = string[left]
    right_char = string[right]
    string[left] = right_char
    string[right] = left_char
    left += 1
    right -= 1
  end
end

# def reverse_words(s)
#   if s.nil?
#     return ""
#   end
#   s.strip!
#   word_list = s.split(" ").reverse!
#   word_list.join(" ")
# end

# def reverse_words(s)
#   if s.nil?
#     return ""
#   end
#   s.strip!
#   s.reverse!
#   result = []
#   s.split(" ").each do |word|
#     result << word.reverse
#   end
#   result.join(" ")
# end

def reverse_words(s)
  if s.nil?
    return ""
  end
  deque = []
  s.split(" ").each do |word|
    deque.push(word)
  end
  result = ""
  until deque.empty?
    result << " "
    result << deque.pop
  end
  result.strip!
end