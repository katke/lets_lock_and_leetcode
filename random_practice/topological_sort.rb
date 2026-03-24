# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  if num_courses.nil? || prerequisites.nil?
    return []
  end
  adj_list = Hash.new { |h,k| h[k] = []}
  indegrees = Array.new(num_courses, 0)
  # populate adj list where key is a prereq and value is the courses it's a prereq for
  prerequisites.each do |c|
    course = c[0]
    prereq = c[1]
    adj_list[prereq] << course
    indegrees[course] += 1
  end
  queue = []
  path = []
  # initialize queue with 0 indegree courses (i.e. courses with no prereqs)
  indegrees.each_with_index do |num_prereqs, course|
    if num_prereqs == 0
      queue << course
    end
  end
  until queue.empty?
    current_course = queue.shift
    path << current_course
    adj_list[current_course].each do |dependent_course|
      indegrees[dependent_course] -= 1
      if indegrees[dependent_course] == 0
        queue << dependent_course
      end
    end
  end
  path.length == num_courses ? path : []
end