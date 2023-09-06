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

image_arr = ["https://res.cloudinary.com/dll73yhjm/image/upload/v1693853433/4vkroh3t10sl5tln05crtvps5mm1.jpg",
             "https://res.cloudinary.com/dll73yhjm/image/upload/v1693849914/luxury-art-deco-apartment-interior_ztds9i.jpg",
             "https://res.cloudinary.com/dll73yhjm/image/upload/v1693849914/scarpa-16_14791_compressed_31FCD1C449F3178CE482BACDE88E7BA5_huqkoc.jpg",
             "https://res.cloudinary.com/dll73yhjm/image/upload/v1693849914/63208132_wgu9kb.jpg",
             "https://res.cloudinary.com/dll73yhjm/image/upload/v1693338351/74qpmn058u2v4svfua5t66gvf3bj.jpg"]

user = User.create!(name: Faker::Name.name, email: 'bob@gmail.com', password: "123456")

10.times do
  flat = Flat.new(address: "#{Faker::Address.city}, UK", price: rand(30..150), rating: rand(1..5), capacity: rand(2..10), description: Faker::Lorem.paragraph, user_id: user.id)
  file = URI.open(image_arr.sample)
  flat.photo.attach(io: file, filename: "something.jpg", content_type: "image/jpg")
  flat.save
end
