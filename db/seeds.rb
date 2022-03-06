require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "DESTROY BOOKINGS"
  # Booking.destroy_all

# puts "DESTROY CARS"
  # Car.destroy_all

# puts "CREATE 2 USERS"
#   2.times do
#     User.create!(email: Faker::Internet.email, password: "azerty")
#   end

# puts "CREATE 3 CARS"
#   3.times do
#     Car.create!(brand: Faker::Vehicle.make, model: Faker::Vehicle.model, year_of_production: 2011, address: "Paris Centre", price_per_day: (25..80).to_a.sample, user_id: User.first.id)
#   end

puts "Adresse aléatoire"
CARS = Car.all
CARS.each do |car|
  car.address = ["Paris, France", "Marseille, France", "Lyon, France", "Nice, France", "Monaco, France"].sample
  car.save!
end

puts "Finished"
