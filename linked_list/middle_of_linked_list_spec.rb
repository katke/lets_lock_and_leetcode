require_relative './middle_of_linked_list'

# Match LC's def
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
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
end


