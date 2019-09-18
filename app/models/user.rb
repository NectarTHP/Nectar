class User < ApplicationRecord
  after_create :welcome_send
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :artworks, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

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

end
