# Given the head of a singly linked list, return the middle node of the linked list.

# If there are two middle nodes, return the second middle node.

# Constraints:

# The number of nodes in the list is in the range [1, 100].
# 1 <= Node.val <= 100

# example 1:
# Input: head = [1,2,3,4,5]
# Output: [3,4,5]
# Explanation: The middle node of the list is node 3.

# Example 2:
# Input: head = [1,2,3,4,5,6]
# Output: [4,5,6]
# Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

# Need to match LC's class def
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
# Runtime: O(n + n/2) => O(n)
# Space: O(1)
def middle_node_less_efficient(head)
    if head.nil?
        return head
    end
    dummy = head
    count = 0
    while dummy != nil do
        count += 1
        dummy = dummy.next
    end
    midpoint = (count / 2)+ 1
    new_count = 0
    dummy = head
    while dummy != nil do
        new_count += 1
        if new_count == midpoint
            return dummy
        end
        dummy = dummy.next
    end 
end

# Fast pointer moves twice as fast as the slow pointer, so by the time the fast pointer reaches the end of the linked list, we can reliably assume the slow pointer is at the mid point
# Runtime: O(n/2) => O(n)
# Space: O(1)
def middle_node(head)
    if head.nil? || head.next.nil?
        return head
    end
    slow = head
    fast = head
    while !fast.nil? && !fast.next.nil? do
        slow = slow.next
        fast = fast.next.next
    end
    slow
end