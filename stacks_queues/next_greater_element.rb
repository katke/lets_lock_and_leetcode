# The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

# You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

# For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

# Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

# Constraints:

# 1 <= nums1.length <= nums2.length <= 1000
# 0 <= nums1[i], nums2[i] <= 104
# All integers in nums1 and nums2 are unique.
# All the integers of nums1 also appear in nums2.
 

# Follow up: Could you find an O(nums1.length + nums2.length) solution?

# Example 1:
# Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
# Output: [-1,3,-1]
# Explanation: The next greater element for each value of nums1 is as follows:
# - 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
# - 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
# - 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
# Runtime: O(n + n + m) => O(n) [since n1 is subset of n2]
# Space: O(n + m + m) => O(n)
def next_greater_element(nums1, nums2)
    stack = []
    map = {}
    nums2.each do |n2|
        while !stack.empty? && n2 > stack[stack.length - 1] do
            map[stack.pop()] = n2
        end
        stack.push(n2)
    end
    while !stack.empty? do
        map[stack.pop()] = -1
    end
    result = []
    nums1.each_with_index do |n1,i|
        result[i] = map[n1]
    end
    result
end