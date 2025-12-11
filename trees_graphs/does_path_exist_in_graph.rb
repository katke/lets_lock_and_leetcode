# There is a bi-directional graph with n vertices, where each vertex is labeled from 0 to n - 1 (inclusive). The edges in the graph are represented as a 2D integer array edges, where each edges[i] = [ui, vi] denotes a bi-directional edge between vertex ui and vertex vi. Every vertex pair is connected by at most one edge, and no vertex has an edge to itself.

# You want to determine if there is a valid path that exists from vertex source to vertex destination.

# Given edges and the integers n, source, and destination, return true if there is a valid path from source to destination, or false otherwise.

# Constraints:

# 1 <= n <= 2 * 10^5
# 0 <= edges.length <= 2 * 10^5
# edges[i].length == 2
# 0 <= ui, vi <= n - 1
# ui != vi
# 0 <= source, destination <= n - 1
# There are no duplicate edges.
# There are no self edges.

# Example 1:
# https://assets.leetcode.com/uploads/2021/08/14/validpath-ex1.png
# Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
# Output: true
# Explanation: There are two paths from vertex 0 to vertex 2:
# - 0 → 1 → 2
# - 0 → 2

# Example 2:
# https://assets.leetcode.com/uploads/2021/08/14/validpath-ex2.png
# Input: n = 6, edges = [[0,1],[0,2],[3,5],[5,4],[4,3]], source = 0, destination = 5
# Output: false
# Explanation: There is no path from vertex 0 to vertex 5.

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @return {Boolean}
# Time: O(e + n)
# Space: O(e + n + n) => O(e + n)
def valid_path(n, edges, source, destination)
    if source == destination
        return true
    end
    graph = Hash.new {|h,k| h[k] = []}
    edges.each do |conn|
        node1 = conn[0]
        node2 = conn[1]
        graph[node1].push(node2)
        graph[node2].push(node1)
    end
    seen = Set[]
    stack = []
    stack.push(source)
    while !stack.empty?
        current = stack.pop()
        graph[current].each do |neighbor|
            if neighbor == destination
                return true
            elsif !seen.include?(neighbor)
                seen.add(current)
                stack.push(neighbor)
            end
        end

    end
    return false
end

def valid_path_recursive(n, edges, source, destination)
    graph = Hash.new {|h,k| h[k] = []}
    edges.each do |conn|
        node1 = conn[0]
        node2 = conn[1]
        graph[node1].push(node2)
        graph[node2].push(node1)
    end
    seen = Set[]
    return dfs(source, graph, seen, destination)
end

def dfs(current_node, graph, seen, destination)
    dfs_found = false
    puts "In dfs call: current #{current_node}"
    if current_node == destination
        return true
    else
        seen.add(current_node)
        graph[current_node].each do |neighbor|
            if !seen.include?(neighbor)
                dfs_found = dfs(neighbor, graph, seen, destination)
                if dfs_found 
                    return true
                end
            end
        end
    end
    dfs_found
end

# Recursive call stack:
# dfs(0) calls dfs(1)
#   dfs(1) calls dfs(2)
#     dfs(2) calls dfs(5)
#       dfs(5) calls dfs(3)
#         dfs(3) calls dfs(4)
#           dfs(4) → returns true (found destination!)
#         dfs(3) → receives true, returns true
#       dfs(5) → receives true, returns true
#     dfs(2) → receives true, returns true
#   dfs(1) → receives true, returns true
# dfs(0) → receives true, returns true