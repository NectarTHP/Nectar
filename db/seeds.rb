# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Favorite.destroy_all
Transaction.destroy_all
Like.destroy_all
Comment.destroy_all
Cart.destroy_all
Artwork.destroy_all
User.destroy_all

#A single test user
user = User.create(email: "tester@test.com", password: "azerty")
artwork = Artwork.create(
  user_id: user.id,
  name: "La Joconde",
  description: "A women staring at the viewer with a quirky smile",
  price: 12750,
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
  categorie: "A category",
  weight: 23,
  size: 9500,
  sale: Date.today,
  tag: "A tag"
)

  #A complete seed

10.times do 
    User.create!(email: Faker::Internet.email, password: "azerty")
end
puts "10 users created"

20.times do
  Artwork.create(
  user_id: User.all.sample.id,
  name: Faker::Book.title,
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(10..10000),
  picture_url: "#",
  weight: 11,
  size: 111,
  sale: Date.today,
  tag: "A tag"
  )
end
puts "20 artworks created"

10.times do
  Favorite.create(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id
  )
end
puts "10 favorites created"

30.times do
  Cart.create(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id
  )
end
puts "30 carts created"

10.times do
  Transaction.create(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id,
    item_qty: rand(1..3),
    order_number: 99,
    tracking_number: "12COLIS4PERDU"
  )
end
puts "10 transaction created"

10.times do
  Like.create(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id
  )
end
puts "10 likes created"

20.times do
  Comment.create(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id,
    comment: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  )
end
puts "20 comments created"
