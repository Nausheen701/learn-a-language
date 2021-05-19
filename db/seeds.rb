# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 40 min into video is the info on creating data

# faker gem

#  10.times do
#   User.create(username: Faker::Name)
# end

# Instructor.create([
#     {first_name: "Mehmet", last_name: "Soykan", email: "mehmet@123.com", username: "mehmet", password: "soykan123"},
#     {first_name: "Pinar", last_name: "Hander", email: "pinar@123.com", username: "pinar", password: "pinar123"},
#     {first_name: "Osman", last_name: "Gazi", email: "osman@123.com", username: "osman", password: "osman123"},
# ])

10.times do
    
    Instructor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, password:"123456")
end

20.times do
    
    Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, password:"123456")
end


# 10.times do
#     Course.create(language: Faker::Language)
# end


