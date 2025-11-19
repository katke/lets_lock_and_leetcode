# Match LC's def
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
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