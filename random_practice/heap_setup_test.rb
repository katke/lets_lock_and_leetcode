require 'algorithms'
class MyProcess
  attr_reader :name
  attr_accessor :frequency
  def initialize(name, frequency)
    @name = name
    @frequency = frequency
  end
end

class Solution
  def define_heaps
    p1 = MyProcess.new("A", 4)
    p2 = MyProcess.new("B", 2)
    p3 = MyProcess.new("C", 1)

    max_heap = Containers::Heap.new {|p1, p2| p1.frequency > p2.frequency}
    min_heap = Containers::Heap.new {|p1, p2| p1.frequency < p2.frequency}
    [p1,p2,p3].each do |process|
      max_heap.push(process)
      min_heap.push(process)
    end
    puts "min heap pop: #{min_heap.pop}"
    puts "max heap pop: #{max_heap.pop}"
  end
end