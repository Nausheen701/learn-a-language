class Instructor < ApplicationRecord
  has_secure_password
  # .authenticate
  # reader and writers for the password
  #  validates the prresence of password
  has_many :courses
  has_many :students, through: :courses

  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: {in: 6..14} 
  


  def to_s
    self.first_name + " " + self.last_name
  end

   # custom method 

   def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Please enter a valid email.")
    end 

  end

    # def self.ins_courses
    #   joins(:courses).group('instructors.name')
    # end

  # reload! => reload console with updated code
end
