class Course < ActiveRecord::Base
  belongs_to :user
  has_many :students
  validates :course_name, presence: true, length: { maximum: 255 }
  validates :course_sequence_number, presence: true, 
                                     length: { maximum: 8 },
                                     numericality: { only_integer: true, allow_nil: true },
                                     uniqueness: { message: "A Course with that sequence number already exists" }
#  default_scope -> { order(:course_name :desc) }
end
