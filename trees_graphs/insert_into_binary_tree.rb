# You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

# Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

# Constraints:

# The number of nodes in the tree will be in the range [0, 10^4].
# -10^8 <= Node.val <= 10^8
# All the values Node.val are unique.
# -10^8 <= val <= 10^8
# It's guaranteed that val does not exist in the original BST.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
# Time: O(log n); O(n) in worst case (linked list)
# Space: O(log n); O(n) in worst case (linked list)
def insert_into_bst(root, val)
   if root.nil?
        return TreeNode.new(val)
   end
   insertion_parent_node = dfs_find_parent(root, root, val)
   insert_node(insertion_parent_node, val)
   root
end

# If target is less than node, go left
# If target is more than node, go right
def dfs_find_parent(node, parent_node, target)
    if node.nil?
        return parent_node
    end
    puts "Visiting node #{node.val}; looking for target #{target}"

    if target > node.val
        dfs_find_parent(node.right, node, target)
    else # target < node.val
        dfs_find_parent(node.left, node, target)
    end
end

def insert_node(parent_node, new_val)
    curr_child_node = nil
    if new_val > parent_node.val
        curr_child_node = parent_node.right
        parent_node.right = TreeNode.new(new_val)
    else
        curr_child_node = parent_node.left
        parent_node.left = TreeNode.new(new_val)
    end 
end