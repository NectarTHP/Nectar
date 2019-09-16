class User < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :cart
  has_many :artworks
  has_many :orders
  has_many :comments
  has_many :favorites

  after_create :create_cart

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def artistname
    if username == nil
      artistname = "#{first_name} #{last_name}"
    else
      artistname = username
    end
    return artistname
  end

  def create_cart
    Cart.create!(user_id: self.id)
  end

end
