# Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

# Constraints:

# The number of nodes in the list is in the range [0, 300].
# -100 <= Node.val <= 100
# The list is guaranteed to be sorted in ascending order.

# Example 1:
# Input: head = [1,1,2]
# Output: [1,2]

# Example 2:
# Input: head = [1,1,2,3,3]
# Output: [1,2,3]

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
# Runtime: O(n)
# Space: O(1)
def delete_duplicates(head)
    # traverse LL
    # store vals in hashset
    # each time we go to a new node, check if val already present
    # if yes, it's a dup, we should remove current node by reassigning prev pointer
    if head.nil?
        head
    end
    prev = nil
    curr_node = head
    while !curr_node.nil? do
        if !prev.nil? && prev.val == curr_node.val
            prev.next = curr_node.next
        else
            prev = curr_node
        end
        curr_node = curr_node.next
    end
    head
end
