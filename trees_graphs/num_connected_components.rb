# You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

# Return the number of connected components in the graph.

# Constraints:

# 1 <= n <= 2000
# 1 <= edges.length <= 5000
# edges[i].length == 2
# 0 <= ai <= bi < n
# ai != bi
# There are no repeated edges.

# Example 1:
# https://assets.leetcode.com/uploads/2021/03/14/conn1-graph.jpg
# Input: n = 5, edges = [[0,1],[1,2],[3,4]]
# Output: 2

# Example 2:
# https://assets.leetcode.com/uploads/2021/03/14/conn2-graph.jpg
# Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
# Output: 1

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
# Runtime: O(e + n + n) => O(e + n)
# Space: O(e + n + n) => O(e + n)
def count_components(n, edges)
    graph = Hash.new {|hash,key| hash[key] = []}
    edges.each do |edge|
        n1 = edge[0]
        n2 = edge[1]
        graph[n1].push(n2)
        graph[n2].push(n1)
    end
    puts "graph: #{graph}"
    components = 0
    seen = Set[]
    stack = []
    (0..n - 1).each do |node|
        start_new_component = false
        if !seen.include?(node)
            stack.push(node)
        end
        while !stack.empty? do
            start_new_component = true
            stack_node = stack.pop()
            seen.add(stack_node)
            graph[stack_node].each do |neighbor|
                if !seen.include?(neighbor)
                    stack.push(neighbor)
                end
            end
        end
        if start_new_component
            components += 1
        end
    end
    components
end

# Runtime: O(e + n + n) => O(e + n)
# Space: O(e + n + n)
def count_components_recursive(n, edges)
    graph = Hash.new {|hash,key| hash[key] = []}
    edges.each do |edge|
        n1 = edge[0]
        n2 = edge[1]
        graph[n1].push(n2)
        graph[n2].push(n1)
    end
    components = 0
    seen = Set[]
    (0..n - 1).each do |node|
        components += dfs(seen, node, graph)
    end
    components
end

def dfs(seen, current_node, graph)
    if seen.include?(current_node)
        return 0
    end
    if graph[current_node].empty?
        return 1
    end
    seen.add(current_node)
    graph[current_node].each do |neighbor|
        if !seen.include?(neighbor)
            dfs(seen, neighbor, graph)
        end
    end
    return 1
end
