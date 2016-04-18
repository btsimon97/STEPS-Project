class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :user_number, presence: true,
                          numericality: { only_integer:true, allow_nil: true },
                          uniqueness: { message: "An account with that user id already exists" },
                          length: {maximum: 8 }

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def fullname 
    "#{first_name} #{last_name}"
  end

  def self.subject
  ["CTE", "ESE", "Language Arts", "Mathematics", 
   "Physical Education", "Reading", "Science", "Social Studies"]
  end
end
