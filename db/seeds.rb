require 'faker'

puts "DESTROY BOOKINGS"
Booking.destroy_all

puts "DESTROY CARS"
Car.destroy_all

puts "DESTROY USERS"
User.destroy_all

puts "CREATE 2 USERS"
User.create!(email: "toto@gmail.com", password: "azerty")
User.create!(email: "bibi@gmail.com", password: "azerty")

puts "CREATE x CARS"
  12.times do
    Car.create!(brand: Faker::Vehicle.make,
                model: Faker::Vehicle.model,
                year_of_production: (2006...2022).to_a.sample,
                price_per_day: (20..90).to_a.sample,
                address: ["Paris", "Marseille", "Lyon", "Nice", "Monaco"].sample,
                engine: ["Automatique", "Manuelle"].sample,
                fuel: ["Essence", "Diesel"].sample,
                kilometers: (15_000...70_000).to_a.sample,
                seats: (4...7).to_a.sample,
                user_id: User.all.sample.id)
  end

puts "Finished"
