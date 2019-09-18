class User < ApplicationRecord
  after_create :welcome_send
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :cart, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

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
