# Given an integer n, generate all combinations of n pairs of well-formed parentheses.



def all_valid_parens(n)
  result = []
  backtrack_paren_combos(n, "", 0, 0, "()", result)
  result
end

def backtrack_paren_combos(n, curr_combo, open_count, close_count, parens_string, result)
  puts "curr_combo #{curr_combo}, open_count: #{open_count}, close_count: #{close_count}"
  if open_count == n && close_count == n && is_valid(curr_combo) # do we know definitively that it's valid?
    puts "adding curr_combo #{curr_combo} to result"
    result << curr_combo.dup
    return
  end
  if open_count > n || close_count > n
    puts "exiting; open_parens: #{open_count}/closed_parens: #{close_count}"
    return
  end
  parens_string.chars.each do |i|
    curr_paren = parens_string[i]
    if curr_paren == "("
      open_count += 1
    else
      close_count += 1
    end
    if is_doomed(curr_combo << curr_paren)
      puts "this combo is doomed, #{curr_combo}, exiting"
      break
    else
      backtrack_paren_combos(n, curr_combo, open_count, close_count, parens_string, result)
      curr_combo.slice!(curr_combo.length - 1, curr_combo.length)
      if curr_paren == "("
        open_count -= 1
      else
        close_count -= 1
      end
    end
  end
end

def is_doomed(paren_combo)
  open_paren = "("
  stack = []
  paren_combo.chars.each do |paren|
    if paren == open_paren
      stack.push(paren)
    else
      last_paren = stack.pop
      if last_paren.nil?
        return false
      end
    end
  end
  false
end

def is_valid(paren_combo)
  open_paren = "("
  stack = []
  paren_combo.chars.each do |paren|
    if paren == open_paren
      stack.push(paren)
    else
      last_paren = stack.pop
      if last_paren.nil?
        return false
      end
    end
  end
  stack.empty?
end