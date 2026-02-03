# Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1, find all possible paths from node 0 to node n - 1 and return them in any order.
#
# The graph is given as follows: graph[i] is a list of all nodes you can visit from node i (i.e., there is a directed edge from node i to node graph[i][j]).
# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
  if graph.empty?
    return []
  end
  puts "graph:"
  graph.each_with_index do |neighbors, index|
    puts "#{index}: #{neighbors}"
  end
  puts "-----------------"
  valid_paths = []
  dfs(graph, 0, [0], graph.size - 1, valid_paths)
  puts "valid_paths: #{valid_paths}"
  valid_paths
end

def dfs(graph, curr_node, curr_path, target, valid_paths)
  puts "dfs() current path: #{curr_path}, curr_node: #{curr_node}, target: #{target}"
  if curr_node == target
    puts "found target"
    valid_paths << curr_path.dup
    return
  elsif graph[curr_node].empty? # dead end node
    puts "found dead end"
    return
  end
  graph[curr_node].each do |next_node|
    curr_path << next_node
    dfs(graph, next_node, curr_path, target, valid_paths)
    puts "backtracking"
    curr_path.pop # either we returned because we hit a dead end or we found the target, remove latest and pick up where we left off
  end
end