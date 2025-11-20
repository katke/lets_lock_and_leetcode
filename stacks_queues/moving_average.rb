# Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

# Implement the MovingAverage class:

# MovingAverage(int size) Initializes the object with the size of the window size.
# double next(int val) Returns the moving average of the last size values of the stream.

# Constraints:

# 1 <= size <= 1000
# -10^5 <= val <= 10^5
# At most 104 calls will be made to next.

# Example 1:
# Input
# ["MovingAverage", "next", "next", "next", "next"]
# [[3], [1], [10], [3], [5]]
# Output
# [null, 1.0, 5.5, 4.66667, 6.0]

# Explanation
# MovingAverage movingAverage = new MovingAverage(3);
# movingAverage.next(1); // return 1.0 = 1 / 1
# movingAverage.next(10); // return 5.5 = (1 + 10) / 2
# movingAverage.next(3); // return 4.66667 = (1 + 10 + 3) / 3
# movingAverage.next(5); // return 6.0 = (10 + 3 + 5) / 3

# Runtime: O(1)
# Space: O(n) => O(1) since constraints limit size to <= 1000
class MovingAverage
    attr_accessor :vals
    attr_reader :max_size
    attr_accessor :running_sum

    def initialize(size)
        @vals = Queue.new
        @max_size = size
        @running_sum = 0
    end

    def next(val)
        if vals.size < max_size
            @vals.push(val)
            @running_sum += val
        else
            removed_val = @vals.pop
            @running_sum -= removed_val
            @vals.push(val)
            @running_sum += val
        end
        @running_sum.to_f / @vals.size
    end
end
    
# :type size: Integer
# :type val: Integer
# :rtype: Float
# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)