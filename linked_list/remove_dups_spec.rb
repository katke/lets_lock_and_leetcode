require_relative './remove_dups'
require_relative '../helpers/linked_list_node'

describe "#delete_duplicates" do
    it "should return the correct output for provided example 1" do
        head = ListNode.new(1)
        node2 = ListNode.new(1)
        node3 = ListNode.new(2)

        head.next = node2
        node2.next = node3

        result = delete_duplicates(head)
        validate_result(result, [1,2])
    end

    it "should return the correct output for provided example 2" do
        head = ListNode.new(1)
        node2 = ListNode.new(1)
        node3 = ListNode.new(2)
        node4 = ListNode.new(3)
        node5 = ListNode.new(3)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        result = delete_duplicates(head)
        validate_result(result, [1,2,3])
    end

    it "should successfully remove multiple duplicates" do
        head = ListNode.new(1)
        node2 = ListNode.new(1)
        node3 = ListNode.new(2)
        node4 = ListNode.new(3)
        node5 = ListNode.new(3)
        node6 = ListNode.new(3)
        node7 = ListNode.new(3)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        result = delete_duplicates(head)
        validate_result(result, [1,2,3])
    end

    it "should return a single node when everything else is a dup" do
        head = ListNode.new(7)
        node2 = ListNode.new(7)
        node3 = ListNode.new(7)
        node4 = ListNode.new(7)
        node5 = ListNode.new(7)
        node6 = ListNode.new(7)
        node7 = ListNode.new(7)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        result = delete_duplicates(head)
        validate_result(result, [7])
    end
end

def validate_result(result, expected_vals_arr)
    result_vals = []
    copy_node = result
    while !copy_node.nil? do
        result_vals.push(copy_node.val)
        copy_node = copy_node.next
    end
    puts "result vals: #{result_vals}"
    iterations = 0
    curr_node = result
    expected_vals_arr.each do |v|
        expect(curr_node.val).to eq(v)
        curr_node = curr_node.next
        iterations += 1
    end
    expect(iterations).to eq(expected_vals_arr.length)
end