# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# User.destroy_all
# Artwork.destroy_all
# Favorite.destroy_all
# Cart.destroy_all
# Transaction.destroy_all
# Like.destroy_all
# Comment.destroy_all

#A single test user
user = User.create(email: test@test.com, password: azerty)
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
    User.create!(email: Faker::Internet.email, password: azerty)
end
puts "10 users created"

20.times do
  Artwork.create(
  user_id: User.all.sample,
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

30.times do
  Cart.create(
    user_id: User.all.sample,
    artwork_id: Artwork.all.sample
  )

create_table "carts", force: :cascade do |t|
  t.bigint "user_id"
  t.bigint "artwork_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["artwork_id"], name: "index_carts_on_artwork_id"
  t.index ["user_id"], name: "index_carts_on_user_id"
end