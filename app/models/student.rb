class Student < ApplicationRecord
  has_secure_password

  has_many :courses
  has_many :instructors, through: :courses
 
  # where does validate come from? activerecord
  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..14}


  def to_s
    self.first_name + " " + self.last_name
  end

  def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Please enter a valid email.")
    end 
  end

   scope :alpha, -> {order('last_name')}
end