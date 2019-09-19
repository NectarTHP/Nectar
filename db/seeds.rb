# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Favorite.destroy_all
LineItem.destroy_all
Like.destroy_all
Comment.destroy_all
Cart.destroy_all
Artwork.destroy_all
User.destroy_all

#A single test user
user = User.create(email: "user@user.com", password: "azerty", is_admin: false, first_name: "John", last_name: "Doe", username:"Banski", adress:"23 rue du haque", city: "Paris" )
admin = User.create(email: "admin@admin.com", password: "azerty", is_admin: true, first_name: "David", last_name: "Etjonathan", username:"Hutch", adress:"1 allée Vouzan", city: "Marseille")

artwork = Artwork.create(
  user_id: user.id,
  name: "Mona Lisa",
  description: "A women staring at the viewer with a quirky smile",
  price: 12750,
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
  categorie: "A category",
  weight: 23,
  size: 9500,
  sale: Date.today,
  tag: "A tag"
)

Artwork.create(
  user_id: user.id,
  name: "Vincent van Gogh",
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(10..10000),
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Vincent_van_Gogh_-_Self-portrait_with_grey_felt_hat_-_Google_Art_Project.jpg/800px-Vincent_van_Gogh_-_Self-portrait_with_grey_felt_hat_-_Google_Art_Project.jpg",
  weight: 11,
  size: 111,
  sale: Date.today,
  tag: "A tag"
  )

  Artwork.create(
    user_id: admin.id,
    name: "Narcisse",
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: rand(10..10000),
    picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Narcissus-Caravaggio_%281594-96%29.jpg/800px-Narcissus-Caravaggio_%281594-96%29.jpg",
    weight: 11,
    size: 111,
    sale: Date.today,
    tag: "A tag"
    )

10.times do 
  User.create!(email: Faker::Internet.email, password: 123456,
   is_artist: Faker::Boolean.boolean, is_admin: Faker::Boolean.boolean, username: Faker::FunnyName.name,
   first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.sentence,
   dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65), siret: Faker::Number.number(digits: 5),
   adress: Faker::Address.street_address, zipcode: Faker::Address.zip_code, city: Faker::Address.city, country: Faker::Address.country, 
   mobile: Faker::PhoneNumber.phone_number, fb_user_ID: Faker::Number.number(digits: 5), insta_user_ID: Faker::Number.number(digits: 5) )
end
puts "10 users were created"


20.times do
  picsum_id = rand(1..100)
  Artwork.create(
  user_id: User.all.sample.id,
  name: Faker::Book.title,
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(10..10000),
  picture_url: "https://picsum.photos/id/#{picsum_id}/600/600",
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

10.times do
  LineItem.create(
    artwork_id: Artwork.all.sample.id,
    cart_id: Cart.all.sample.id,
    order_id: nil,
    quantity: rand(1..3),
    tracking_number: "12COLIS4PERDU"
  )
end
puts "10 line items created"

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
