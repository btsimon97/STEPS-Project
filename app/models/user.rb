class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates(:email, presence: true)
end
