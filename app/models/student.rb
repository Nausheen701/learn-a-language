class Student < ApplicationRecord
  has_secure_password
  has_many :courses
  # courses<<
  has_many :instructors, through: :courses

  accepts_nested_attributes_for :courses
  
  # where does validate come from? activerecord
  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..14}

  # validator going to check that there are 2 words when name is ssubmitted
end
