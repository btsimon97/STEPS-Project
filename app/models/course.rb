class Course < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :students
  validates :course_name, presence: true, length: { maximum: 255 }
  validates :course_sequence_number, presence: true, 
                                     length: { maximum: 8 },
                                     numericality: { only_integer: true, allow_nil: true },
                                     uniqueness: { message: "A Course with that sequence number already exists" }
  validates :period, presence: true, 
                     length: { maximum: 3 },
                     numericality: { only_integer: true, allow_nil: true }

#  default_scope -> { order(:course_name :desc) }

  def self.period
    ['01','02','03','04','05','06','07','08','11','12','13','14','21','22','23','24']
  end


end
 
