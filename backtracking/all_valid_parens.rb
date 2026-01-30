# Given an integer n, generate all combinations of n pairs of well-formed parentheses.



def all_valid_parens(n)
  result = []
  backtrack_paren_combos(n, "", 0, 0, result)
  result
end

def backtrack_paren_combos(n, curr_combo, open_count, close_count, result)
  puts "curr_combo #{curr_combo}, open_count: #{open_count}, close_count: #{close_count}"
  if open_count == n && close_count == n
    puts "adding curr_combo #{curr_combo} to result"
    result << curr_combo.dup
    return
  end

  if open_count < n
    backtrack_paren_combos(n, curr_combo + "(", open_count + 1, close_count,  result)
  end
  if close_count < open_count
    backtrack_paren_combos(n, curr_combo + ")", open_count, close_count + 1, result)
  end
end
