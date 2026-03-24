# The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.
#
#   For example, for arr = [2,3,4], the median is 3.
#   For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
#   Implement the MedianFinder class:
#
#   MedianFinder() initializes the MedianFinder object.
#   void addNum(int num) adds the integer num from the data stream to the data structure.
#   double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.

require_relative "./../helpers/heap"

class MedianFinder
  attr_reader :min_heap
  attr_reader :max_heap

  def initialize
    @min_heap = Heap.new(false)
    @max_heap = Heap.new(true)
  end


=begin
    :type num: Integer
    :rtype: Void
=end
  def add_num(num)
    @max_heap.add(num)

    @min_heap << @max_heap.pop

    if @max_heap.size < @min_heap.size
      @max_heap << @min_heap.pop
    end
  end


=begin
    :rtype: Float
=end
  def find_median()
    if @min_heap.size == @max_heap.size
      (@max_heap.peek + @min_heap.peek) / 2.0
    else
      @max_heap.peek.to_f
    end
  end


end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()