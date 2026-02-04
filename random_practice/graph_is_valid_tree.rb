# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
def valid_tree(n, edges)
  puts "n #{n}, edges #{edges}"
  graph = build_adj_list(edges)
  puts "graph #{graph}"
  queue = []
  parent = {}
  queue << 0
  until queue.empty? do
    curr = queue.shift
    graph[curr].each do |neighbor|
      if parent[curr] == neighbor # trivial loop, ignore
        next
      end

      unless parent[neighbor].nil?
        return false # we've found a cycle
      end
      parent[neighbor] = curr
      queue << neighbor
    end
  end
  parent.size == n - 1
end

def build_adj_list(edges)
  graph = Hash.new {|h,k| h[k] = []}
  edges.each do |edge|
    v1 = edge[0]
    v2 = edge[1]
    graph[v1] << v2
    graph[v2] << v1
  end
  graph
end