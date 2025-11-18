class DoublyLinkedNode
    attr_accessor :val, :next_node, :prev_node

    def initialize(val, next_node = nil, prev_node = nil)
        @val = val
        @next_node = next_node
        @prev_node = prev_node
    end
end