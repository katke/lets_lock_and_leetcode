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
end