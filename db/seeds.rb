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
   User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "user#{i}@yopmail.com",
      encrypted_password: "azerty",
      description: Faker::Lorem.sentence(word_count: 10)
   )
end


5.times do
   Event.create(
      start_date: Faker::Date.between(from: '2022-05-17', to: '2022-12-31'),
      duration: Faker::Number.within(range: 1..15),
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Number.within(range: 1..999),
      location: Faker::Games::Pokemon.location,
      admin: User.all.sample
   )
end


   Event.all.each do |event|
      3.times do 
         Attendance.create!(
            attendant: User.all.sample,
            event: event
         )
      end
   end





#User.create(email:"user10@yopmail.com", encrypted_password: "azerty", description:"azerty", first_name:"foucauld", last_name:"beaumont")
#User.create(email:"foucauld0@yopmail.com", encrypted_password: "azerty", description:"azerty", first_name:"foucauld", last_name:"beaumont")