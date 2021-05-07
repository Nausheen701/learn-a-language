class Instructor < ApplicationRecord
  has_secure_password
  # .authenticate
  # reader and writers for the password
  #  validates the prresence of password
  has_many :courses
  has_many :students, through: :courses

  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
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

      # scope method that organizes courses by their instructors 

    # write a scope method as class method

    # def self.ins_courses
    #   joins(:courses).group('instructors.name')
    # end

    # scope method 

    # scope :orgs_donations, -> {joins(:donations).group('organizations.name')}
        
    # alphabetize the list of instructors
    scope :alpha, -> {order('username')}

  # reload! => reload console with updated code
end
