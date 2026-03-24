# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  s_map = build_string_map(s)
  puts "s_map 1: #{s_map}"
  s_map = decrement_map(t, s_map)
  puts "s_map 2: #{s_map}"
  s_map.values.none? {|val | val > 0 || val < 0 }
end

def build_string_map(string)
  map = Hash.new(0)
  string.each_char do |char|
    map[char] += 1
  end
  map
end

def decrement_map(string, map)
  string.each_char do |char|
    map[char] -= 1
  end
  map
end