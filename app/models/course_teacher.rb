class CourseTeacher < ActiveRecord::Base
  belongs_to :teacher, class_name 'User', foreign_key: 'user_id'
  belongs_to :teaching_course, class_name: 'Course', foreign_key: 'course_id'
end
