#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name:            "Example",
             last_name:             "User",
             user_id_number:        123456,
             email:                 "example@stepsproject.net",
             password:              "foobar12",
             password_confirmation: "foobar12")

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_id_number = Faker::Number.number(6)
  email = Faker::Internet.email
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,
               user_id_number: user_id_number,
               email: email,
               password: password,
               password_confirmation: password)
end
