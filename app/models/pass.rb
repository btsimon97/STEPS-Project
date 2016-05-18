class Pass < ActiveRecord::Base
  belongs_to :user
  belongs_to :student
  
  validates :student_id, presence: true
  validates :destination, presence: true
  def self.destinations
    User.by_school(current_user.school_name)
  end
end
