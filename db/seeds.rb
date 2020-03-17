# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Destroying all datas in the DB'
User.destroy_all
puts 'Users have been destroyed'
Donor.destroy_all
puts 'Donors have been destroyed'
Donation.destroy_all
puts 'Donations have been destroyed'

User.create!(email: 'thomas@gmail.com', password: 'thomas@gmail.com', first_name: 'Thomas', last_name: 'Rodier')
puts "#{User.count} User have been created"

5.times do
  Donor.create!(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, city: Faker::Address.city, email: Faker::Internet.email, status: 'donateur')
end
Donor.create!(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, city: Faker::Address.city, email: Faker::Internet.email, status: 'adherent')
puts "#{Donor.count} Donors have been created"

5.times do
  Donor.all.each do |donor|
    Donation.create!(donor_id: donor.id, amount: Faker::Number.number(digits: 3))
  end
end

puts "#{Donation.count} donations have been created"
