# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Favorite.destroy_all
Like.destroy_all
Comment.destroy_all
Order.destroy_all
Artwork.destroy_all
User.destroy_all
Cart.destroy_all
LineItem.destroy_all

#Full dataset for artist 1.
user = User.create(
  email: "artist1@artist.com", 
  password: "azerty", 
  comment: Faker::Quote.famous_last_words,
  is_admin: false, 
  is_artist: true, 
  username:"Banskool", 
  first_name: "John", 
  last_name: "Doe", 
  bio: Faker::Lorem.paragraph,
  dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65),
  siret: "THP6765CR",
  adress:"23 rue du haque",
  zipcode: "92100", 
  city: "Paris",
  country: "France",
  mobile: Faker::PhoneNumber.phone_number
  )
Artwork.create(
  user_id: user.id,
  name: "Mona Lisa",
  description: "A women staring at the viewer with a quirky smile",
  price: 3750,
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
  categorie: "Oil on canvas",
  weight: 23,
  height: 9500,
  width: 7800,
  sale: Date.today,
  tag: "Portrait"
  )
Artwork.create(
  user_id: user.id,
  name: "Vincent van Gogh",
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(10..5000),
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Vincent_van_Gogh_-_Self-portrait_with_grey_felt_hat_-_Google_Art_Project.jpg/800px-Vincent_van_Gogh_-_Self-portrait_with_grey_felt_hat_-_Google_Art_Project.jpg",
  categorie: "Oil on canvas",
  weight: 11,
  height: 9500,
  width: 7800,
  sale: Date.today,
  tag: "Portrait",
  )
Artwork.create(
  user_id: user.id,
  name: "Narcisse",
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(10..5000),
  picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Narcissus-Caravaggio_%281594-96%29.jpg/800px-Narcissus-Caravaggio_%281594-96%29.jpg",
  categorie: "Oil on canvas",
  weight: 11,
  height: 9500,
  width: 7800,
  sale: Date.today,
  tag: "Oil on wood"
  )
  #Create 5 more random artworks for artist 
5.times do
  picsum_id = rand(1..1000)
  Artwork.create(
    user_id: user.id,
    name: Faker::Book.title,
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: rand(10..5000),
    picture_url: "https://picsum.photos/id/#{picsum_id}/600/600",
    categorie: Faker::Hacker.adjective,
    weight: 11,
    height: 9500,
    width: 7800,
    sale: Date.today,
    tag: Faker::Hacker.adjective
    )
end
puts "Dataset for artist 1 created"
#Full dataset for artist 1 /

#Create 9 random artists
9.times do
  User.create(
    email: Faker::Internet.email, 
    password: "azerty", 
    comment: Faker::Quote.famous_last_words,
    is_admin: false, 
    is_artist: true, 
    username: Faker::FunnyName.name, 
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    bio: Faker::Lorem.paragraph,
    dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65),
    siret: "THP6765CR",
    adress: Faker::Address.street_address,
    zipcode: Faker::Address.zip_code, 
    city: Faker::Address.city,
    country: Faker::Address.country,
    mobile: Faker::PhoneNumber.phone_number
    )
  end
puts "9 random artists created"

#Create 30 random artworks 
30.times do
  picsum_id = rand(1..1000)
  Artwork.create(
    user_id: User.all.sample.id,
    name: Faker::Book.title,
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: rand(10..5000),
    picture_url: "https://picsum.photos/id/#{picsum_id}/600/600",
    categorie: Faker::Hacker.adjective,
    weight: 11,
    height: 9500,
    width: 7800,
    sale: Date.today,
    tag: Faker::Hacker.adjective
    )
  end
puts "30 artworks created"

#Full dataset for user 1
user = User.create(
  email: "user1@user.com", 
  password: "azerty", 
  comment: Faker::Quote.famous_last_words,
  is_admin: false, 
  is_artist: false, 
  username:"Johnny", 
  first_name: "John", 
  last_name: "Doe", 
  bio: Faker::Lorem.paragraph,
  dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65),
  siret: "THP6765CR",
  adress:"1 allée Vouzan",
  zipcode: "13009", 
  city: "Marseille",
  country: "France",
  mobile: Faker::PhoneNumber.phone_number
  )
3.times do
  order = Order.create(
    user_id: user.id,
    first_name: user.first_name,
    last_name: user.last_name,
    email: user.email,
    mobile: user.mobile,
    adress: user.adress,
    city: user.city,
    country: user.country,
  )
  end
10.times do
  LineItem.create(
    artwork_id: Artwork.all.sample.id,
    order_id: Order.all.sample.id,
    quantity: 1,
    tracking_number: "12COLIS4PERDU"
  )
  end
puts "10 line items created"
#Full dataset for user 1 /

#Create 9 random users 
9.times do 
  User.create!(
  email: Faker::Internet.email,
  password: "azerty",
  is_artist: false,
  is_admin: Faker::Boolean.boolean,
  username: Faker::FunnyName.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  bio: Faker::Lorem.sentence,
  dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65),
  siret: Faker::Number.number(digits: 5),
  adress: Faker::Address.street_address,
  zipcode: Faker::Address.zip_code, city: Faker::Address.city,
  country: Faker::Address.country, 
  mobile: Faker::PhoneNumber.phone_number,
  fb_user_ID: Faker::Number.number(digits: 5),
  insta_user_ID: Faker::Number.number(digits: 5)
  )
  end
puts "9 users were created"