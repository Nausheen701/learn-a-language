class Student < ApplicationRecord
  has_secure_password
  has_many :courses
  # courses<<
  has_many :instructor, through: :courses

  accepts_nested_attributes_for :courses
  
  # where does validate come from? activerecord
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 8..15}

  # validator going to check that there are 2 words when name is ssubmitted
end
