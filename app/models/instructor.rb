class Instructor < ApplicationRecord
  has_secure_password
  # .authenticate
  # reader and writers for the password
  #  validates the presence of password
  has_many :courses
  has_many :students, through: :courses

  validates :first_name, :username, presence: true
  validates :username, :last_name, uniqueness: true
  validates :password, allow_nil: true, length: {in: 6..20} 
  

  def to_s
    self.first_name + " " + self.last_name
  end

   # custom method 
  
   def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Please enter a valid email.")
    end 
  end

# alphabetize the list of instructors
  scope :alpha, -> {order('last_name')}

  # 2 ways to write scope methods
    # scope method that organizes courses by their instructors 
    # 1-write a scope method as class method

    # def self.ins_courses
    #   joins(:courses).group('instructors.last_name')
    # end
# in instructors controller
  # def index
    #   @instructors = Instructor.ins_courses
    # end

    # 2- scope macro 
     scope :ins_courses, -> {joins(:courses).group('instructors.last_name')}

    

     


  # reload! => reload console with updated code
end
