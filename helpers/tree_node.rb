class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# For ex: [3,9,20,null,null,15,7] <=>
#          3
#      9      20
#          15    7
def build_arr_from_tree(root)
    queue = Queue.new
    vals = []
    queue.enq(root)
    while !queue.empty? do
        curr = queue.deq()
        if curr.nil?
            vals.push(nil)
        else
            vals.push(curr.val)
            queue.enq(curr.left)
            queue.enq(curr.right)
        end
    end
    puts "vals: #{vals}"
    vals
end

# Builds a binary tree from an array representation (level-order)
# For ex: [3,9,20,nil,nil,15,7] <=>
#          3
#      9      20
#          15    7
# @param {Array} arr - Array of values in level-order, nil represents null nodes
# @return {TreeNode} - Root node of the constructed tree
def build_tree_from_arr(arr)
    return nil if arr.nil? || arr.empty? || arr[0].nil?
  
    nodes = arr.map { |v| v.nil? ? nil : TreeNode.new(v) }
  
    nodes.each_with_index do |node, i|
      next if node.nil?
      left_i = 2*i + 1
      right_i = 2*i + 2
      node.left  = nodes[left_i]  if left_i < nodes.length
      node.right = nodes[right_i] if right_i < nodes.length
    end
  
    nodes[0]
  end
  
  # Sideways ASCII tree printer
  def print_tree(node, prefix = "", is_left = true)
    return if node.nil?
  
    print_tree(node.right, prefix + (is_left ? "│   " : "    "), false)
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.val}"
    print_tree(node.left,  prefix + (is_left ? "    " : "│   "), true)
  end


def validate_binary_tree_node_result(result, expected_tree_root)
    expected_queue = Queue.new
    actual_queue = Queue.new
    expected_queue.enq(expected_tree_root)
    actual_queue.enq(result)
    while !expected_queue.empty? || !actual_queue.empty? do
        if expected_queue.empty? && !actual_queue.empty?
            puts "Actual queue is not empty, but expected queue is"
            return false
        elsif !expected_queue.empty? && actual_queue.empty?
            puts "Expected queue is not empty, but actual is"
            return false
        end
        actual_node = actual_queue.deq()
        expected_node = expected_queue.deq()
        if actual_node.val != expected_node.val
            puts "Actual node val #{actual_node.val}, expected #{expected_node.val}; test fails"
            return false
        end
        if !actual_node.left.nil? && !expected_node.left.nil?
            actual_queue.enq(actual_node.left)
            expected_queue.enq(expected_node.left)
        elsif !actual_node.left.nil? && expected_node.left.nil?
            puts "Actual node left is #{actual_node.left.val}, but expected it to be nil"
            return false
        elsif actual_node.left.nil? && !expected_node.left.nil?
            puts "Expected node left is #{expected_node.left.val}, but actual node left is nil"
            return false
        end

        if !actual_node.right.nil? && !expected_node.right.nil?
            actual_queue.enq(actual_node.right)
            expected_queue.enq(expected_node.right)
        elsif !actual_node.right.nil? && expected_node.right.nil?
            puts "Actual node right is #{actual_node.right.val}, but expected it to be nil"
            return false
        elsif actual_node.right.nil? && !expected_node.right.nil?
            puts "Expected node right is #{expected_node.right.val}, but actual node right is nil"
            return false
        end
    end
    true
end

