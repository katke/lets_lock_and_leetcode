require_relative './reverse_2'
require_relative '../helpers/linked_list_node'

describe "#reverse_between" do
    it "should return the correct output for provided example 1" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5

        result = reverse_between(head, 2, 4)
        validate_result(result, [1,4,3,2,5])
    end

    it "should return the correct output for provided example 2" do
        head = ListNode.new(5)

        result = reverse_between(head, 1, 1)
        validate_result(result, [5])
    end

    it "should handle an even number of reversed nodes correctly" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)
        node6 = ListNode.new(6)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6

        result = reverse_between(head, 2, 5)
        validate_result(result, [1,5,4,3,2,6])
    end

    it "should handle reversing the full list correctly" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)
        node6 = ListNode.new(6)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6

        result = reverse_between(head, 1, 6)
        validate_result(result, [6,5,4,3,2,1])
    end


    it "should handle single node reverse correctly" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)
        node6 = ListNode.new(6)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6

        result = reverse_between(head, 3, 3)
        validate_result(result, [1,2,3,4,5,6])
    end

    it "should handle reversing from the start but not the entire list" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5

        result = reverse_between(head, 1, 3)
        validate_result(result, [3,2,1,4,5])
    end

    it "should handle reversing the first two nodes" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)

        head.next = node2
        node2.next = node3
        node3.next = node4

        result = reverse_between(head, 1, 2)
        validate_result(result, [2,1,3,4])
    end

    it "should handle reversing the last two nodes" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)

        head.next = node2
        node2.next = node3
        node3.next = node4

        result = reverse_between(head, 3, 4)
        validate_result(result, [1,2,4,3])
    end

    it "should handle reversing two adjacent nodes in the middle" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5

        result = reverse_between(head, 2, 3)
        validate_result(result, [1,3,2,4,5])
    end

    it "should handle a two-node list with both nodes reversed" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)

        head.next = node2

        result = reverse_between(head, 1, 2)
        validate_result(result, [2,1])
    end

end