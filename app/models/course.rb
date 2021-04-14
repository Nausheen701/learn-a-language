class Course < ApplicationRecord
   belongs_to :instructor, optional: true
   belongs_to :student, optional: true

    # what can go in here?
        # query methods / scope methods
        # validations
        # helper methods
        # domain logic
        # associations

        # accepts_nested_attributes_for :student
    # student=(objects)

    # custom writer

    def student_attributes=(attr_hash)
        # see if the object exists first
        # create it if it doesn't
        if !attr_hash.empty?
            self.student = student.find_or_create_by(attr_hash) #return a studentobject
        end
            # let item know about this student object
    end 

end
