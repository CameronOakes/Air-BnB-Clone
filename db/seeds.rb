# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

User.destroy_all

user = User.create!(name: Faker::Name.name, email: 'bob@gmail.com', password: "123456")

10.times do
  flat = Flat.new(address: Faker::Address.full_address, price: 75, rating: 6, capacity: 4, user_id: user.id)
  file = URI.open("https://res.cloudinary.com/dll73yhjm/image/upload/v1693338351/74qpmn058u2v4svfua5t66gvf3bj.jpg")
  flat.photo.attach(io: file, filename: "something.jpg", content_type: "image/jpg")
  flat.save
end
