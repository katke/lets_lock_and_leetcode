def reverse_grouped_string(string)
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
      reverse_word(string, left, right)
      left = right
    end
  end
  string
end

def reverse_word(string, left, right)
  while left < right
    left_char = string[left]
    right_char = string[right]
    string[left] = right_char
    string[right] = left_char
    left += 1
    right -= 1
  end
end

def reverse_grouped_string_no_constraints(string)
  split = string.split(" ")
  result = ""
  i = split.length - 1
  while i >= 0
    result << split[i]
    if i != 0
      result << " "
    end
    i -= 1
  end
  result
end