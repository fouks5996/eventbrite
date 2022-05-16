# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all


10.times do |i|
   User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "user#{i}@yopmail.com",
      encrypted_password: "azerty",
      description: Faker::Lorem.sentence(word_count: 10),
   )
end

#User.create(email:"user10@yopmail.com", encrypted_password: "azerty", description:"azerty", first_name:"foucauld", last_name:"beaumont")