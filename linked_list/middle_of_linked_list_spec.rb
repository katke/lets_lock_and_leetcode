require_relative './middle_of_linked_list'
require_relative '../helpers/linked_list_node'

describe "#middle_node_less_efficient" do
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
        result = middle_node_less_efficient(head)
        expect(result).to eq(node3)
    end

    it "should return the correct output for provided example 2" do
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
        result = middle_node_less_efficient(head)
        expect(result).to eq(node4)
    end

    it "should return the tail when there are only two nodes" do
        head = ListNode.new(1)
        tail = ListNode.new(2)

        head.next = tail
        result = middle_node_less_efficient(head)
        expect(result).to eq(tail)
    end

    it "should return the head when there is only one node" do
        head = ListNode.new(1)
        result = middle_node_less_efficient(head)
        expect(result).to eq(head)
    end
end


describe "#middle_node" do
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
        result = middle_node(head)
        expect(result).to eq(node3)
    end

    it "should return the correct output for provided example 2" do
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
        result = middle_node(head)
        expect(result).to eq(node4)
    end

    it "should return the tail when there are only two nodes" do
        head = ListNode.new(1)
        tail = ListNode.new(2)

        head.next = tail
        result = middle_node(head)
        expect(result).to eq(tail)
    end

    it "should return the head when there is only one node" do
        head = ListNode.new(1)
        result = middle_node(head)
        expect(result).to eq(head)
    end

    it "should handle longer linked lists" do
        head = ListNode.new(1)
        node2 = ListNode.new(2)
        node3 = ListNode.new(3)
        node4 = ListNode.new(4)
        node5 = ListNode.new(5)
        node6 = ListNode.new(6)
        node7 = ListNode.new(7)
        node8 = ListNode.new(8)
        node9 = ListNode.new(9)
        node10 = ListNode.new(10)
        node11 = ListNode.new(11)
        node12 = ListNode.new(12)
        node13 = ListNode.new(13)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node8
        node8.next = node9
        node9.next = node10
        node10.next = node11
        node11.next = node12
        node12.next = node13
        result = middle_node(head)
        expect(result).to eq(node7)
    end
end


