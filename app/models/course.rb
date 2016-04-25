class Course < ActiveRecord::Base
  belongs_to :user
  has_many :students
#  default_scope -> { order(:course_name :desc) }
end
