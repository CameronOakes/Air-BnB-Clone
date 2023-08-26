# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all

user = User.create!(name: Faker::Name.name, email: 'bob@gmail.com', password: "123456")

10.times do
  Flat.create!(address: Faker::Address.full_address, price: 75, rating: 6, capacity: 4, user_id: user.id)
end
