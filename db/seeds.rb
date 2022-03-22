# require 'faker'
# Faker DOESN'T WORK in PRODUCTION

BRAND = ["Peugeot","Citroën","Opel","Toyota","Skoda","Mercedes-Benz","BMW","Peugeot","Hyundai","Ford","Audi","Volkswagen","Nissan","Seat","Kia","Land Rover","Mini"]
MODEL = %w[Altima Malibu Civic Altima Regal Accord M3 A7 Corolla Versa A5
            MKS MKZ Malibu A7 Versa MKZ Durango Charger Rogue Focus Encore
            Accord A8 F150 X3 A4 X3 Camero Encore Pathfiner Fiesta Prius M5
            Silver MKZ Camry Enclave Cube Fiesta Pathfiner Ram]

CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Lens", "Montpellier", "Strasbourg"]
ADDRESS = ["#{(27..150).to_a.sample}, place Rémy Barbe", "#{(27..150).to_a.sample}, rue Charlotte Torres", "#{(27..150).to_a.sample}, impasse Bouvier", "#{(27..150).to_a.sample}, impasse Martineau","#{(27..150).to_a.sample}, avenue Vallee", "#{(27..150).to_a.sample}, boulevard de Poirier", "#{(27..150).to_a.sample}, rue de Brunel"]

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
    Car.create!(brand: BRAND.sample,
                model: MODEL.sample,
                year_of_production: (2006...2022).to_a.sample,
                price_per_day: (20..90).to_a.sample,
                address: "#{ADDRESS.sample}, #{CITY.sample}",
                engine: ["Automatique", "Manuelle"].sample,
                fuel: ["Essence", "Diesel"].sample,
                kilometers: (15_000...70_000).to_a.sample,
                seats: (4...7).to_a.sample,
                user_id: User.all.sample.id)
  end

puts "Finished"
