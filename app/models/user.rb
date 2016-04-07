
class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_validation { user_id_number = '#{user_id_number}'.to_i } 
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :user_id_number, presence: true, 
                             numericality: { only_integer: true, allow_nil: true }, 
                             uniqueness: { message: "An account with that user id already exists" },
                             length: {maximum: 8 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  def fullname
    "#{first_name} #{last_name}"
  end
end
