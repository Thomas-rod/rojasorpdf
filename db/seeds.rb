# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Destroying all datas in the DB'
User.destroy_all if Rails.env.development?
puts 'Users have been destroyed'
Donor.destroy_all if Rails.env.development?
puts 'Donors have been destroyed'
Donation.destroy_all if Rails.env.development?
puts 'Donations have been destroyed'
CsvStorage.destroy_all if Rails.env.development?
puts 'Csv input row have been destroyed'


User.create!(email: 'thomas@gmail.com', password: 'thomas@gmail.com', first_name: 'Thomas', last_name: 'Rodier')
puts "#{User.count} User have been created"

5.times do
  Donor.create!(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, city: Faker::Address.city, email: Faker::Internet.email, status: 'donateur')
end
Donor.create!(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, city: Faker::Address.city, email: Faker::Internet.email, status: 'adherent')
thomas = Donor.create!(first_name: 'Thomas', last_name: 'Rodier', address: '14 rue des lyonnais', zip_code: '33000', city: 'Bordeaux', email: 'rodiert17@gmail.com', status: 'adherent')
puts "#{Donor.count} Donors have been created"

5.times do
  Donor.all.each do |donor|
    Donation.create!(donor_id: donor.id, amount: Faker::Number.number(digits: 3), date: Faker::Date.between(from: 2.days.ago, to: Date.today))
  end
end
Donation.create!(donor: thomas, amount: 350, date: Faker::Date.between(from: 2.days.ago, to: Date.today))

puts "#{Donation.count} donations have been created"
