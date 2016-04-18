class CourseStudent < ActiveRecord::Base
  belongs_to :student, class_name: 'User', foreign_key: 'user_id'
  belongs_to :attending_course, class_name: 'Course', foreign_key: 'course_id'
end
