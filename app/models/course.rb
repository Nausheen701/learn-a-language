class Course < ApplicationRecord
   belongs_to :instructor
   belongs_to :student
   validates :language, :level, presence: true
   


end
