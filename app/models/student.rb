class Student < ApplicationRecord
  has_secure_password

  has_many :courses
  has_many :instructors, through: :courses

  accepts_nested_attributes_for :courses
  
  # where does validate come from? activerecord
  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..14}

  # validator going to check that there are 2 words when name is ssubmitted

  def to_s
    self.first_name + " " + self.last_name
  end

   # custom method 

   def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Please enter a valid email.")
    end 

end

end