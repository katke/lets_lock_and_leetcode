class Heap
  attr_reader :heap
  attr_reader :is_max_heap

  def initialize(is_max_heap)
    @heap = []
    @is_max_heap = is_max_heap
  end

  def add(val)
    @heap << val
    if @is_max_heap
      @heap.sort! { |a, b| b <=> a } # descending
    else
      @heap.sort!
    end
  end

  def pop
    @heap.shift
  end

  def peek
    @heap[0]
  end

  def empty?
    @heap.empty?
  end

  def size
    @heap.size
  end
end