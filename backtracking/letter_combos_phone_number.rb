# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
#
# A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


def letter_mapping_iterative(digits)
  if digits.empty?
    return []
  end
  letter_map = get_digit_to_letter_mapping
  result = []
  queue = []
  queue.push("")
  digits.chars.each do |num|
    puts "num #{num}"
    # queue size tracks the current number of partial permutations we've built, which we'll be adding on in the next loop
    queue_size = queue.size
    (0...queue_size).each do
      puts "queue iteration---"
      curr = queue.shift
      puts "curr #{curr}"
      letter_map[num].chars.each do |letter|
        # need ot copy the curr partial permutation because we'll need to append each of the 3-4 letters onto it during this inner loop
        curr_copy = curr.dup
        curr_copy << letter
        if curr_copy.length == digits.length
          # we've met the expected length of a valid permutation, add to results; don't add to queue as we don't need to add on anymore letters
          result.push(curr_copy)
        else
          # we haven't reached a full permutation yet, add back to queue in current state so we can pop it off and add the next letter
          queue.push(curr_copy)
        end
      end
    end
  end
  result
end

def letter_mapping_recursive(digits)
  if digits.empty?
    return []
  end
  map = get_digit_to_letter_mapping
  result = []
  build_permutation(digits, 0, "", result, map)
  result
end

def build_permutation(digits, digit_index, curr_perm, result, digit_map)
  if digit_index == digits.length
    result << curr_perm.dup
    return
  end
  digit_map[digits[digit_index]].chars.each do |letter|
    curr_perm << letter
    build_permutation(digits, digit_index + 1, curr_perm, result, digit_map)
    curr_perm.chop!
  end
end

def get_digit_to_letter_mapping
  {
    "2" => "abc",
    "3" => "def",
    "4" => "ghi",
    "5" => "jkl",
    "6" => "mno",
    "7" => "pqrs",
    "8" => "tuv",
    "9" => "wxyz"
  }
end