# require 'faker'
# Faker DOESN'T WORK in PRODUCTION

MARQUES = ["Toyota","Skoda","Mercedes-Benz","BMW","Peugeot","Hyundai","Ford","Audi","Volkswagen","Nissan","Seat","Kia","Land Rover","Mini","Peugeot","Citroën","Opel"]
MODELES = %w[Altima Malibu Civic Altima Regal Camero Accord M3 A7 Corolla Versa A5
            MKS MKZ Malibu A7 Versa MKZ Durango Charger Ram M5 Rogue Focus MKS Encore
            Accord A8 F150 X3 A4 X3 Camero Encore Pathfiner Fiesta Prius Ram M5
            Silverado MKZ Camero Camero Mustang Camry Enclave Cube Fiesta Pathfiner Ram]
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
    Car.create!(brand: MARQUES.sample,
                model: MODELES.sample,
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
