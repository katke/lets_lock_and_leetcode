# Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

# Example 1:
# Input: head = [1,2,3,4,5], left = 2, right = 4
# Output: [1,4,3,2,5]

# Example 2:
# Input: head = [5], left = 1, right = 1
# Output: [5]

# Constraints:

# The number of nodes in the list is n. 
# 1 <= n <= 500
# -500 <= Node.val <= 500
# 1 <= left <= right <= n
 
# Follow up: Could you do it in one pass?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
# Runtime: O(n)
# Space: O(1)
def reverse_between(head, left, right)
    if head.nil? || head.next.nil? || left == right
        return head
    end
    
    dummy = ListNode.new(0)
    dummy.next = head
    
    # Find the node before the reversal starts
    prev = dummy
    (1...left).each do |i|
        prev = prev.next
    end
    
    # Start reversing from start position until we reach end position
    curr = prev.next
    next_node = curr.next
    
    (left...right).each do |i|
        curr.next = next_node.next
        next_node.next = prev.next
        prev.next = next_node
        next_node = curr.next
    end
    
    dummy.next
end