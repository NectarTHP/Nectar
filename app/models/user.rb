class User < ApplicationRecord
  puts "$"*60;puts "user.rb called";puts "$"*60

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artworks
  has_many :carts
  has_many :transactions
  has_many :comments
  has_many :favorites

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
