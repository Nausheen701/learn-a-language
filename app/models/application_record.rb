class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # this class will not have a table or be instantiated
end



# what activerecord methods?

#  query users table to treturn a user with an 
  # User.find_by_(id: 1)
  # User.find_by_id(1) 

# query user table by username
  # User.find_by(username: "aysan")
  # User.find_by_username()
  # .where? => condition neesd to be met
  # User.where(username: "aysan")

# persisting data to the table
  #  .save
  #  .create => .new + .save

# .first and .last

#  all users created
  #  .all

#  .pluck
# Car.pluck(:model) => returns an array of all the items created