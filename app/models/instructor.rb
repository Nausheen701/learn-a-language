class Instructor < ApplicationRecord
  has_secure_password
  has_many :courses
  has_many :students, through: :courses

  # validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  # validates :password, length: { in: 6..14}
  validates :bio, length: { maximum: 500}

  def to_s
    self.first_name + " " + self.last_name
  end

  # reload! => reload console with updated code
end
