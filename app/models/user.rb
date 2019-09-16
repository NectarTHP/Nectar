class User < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :artworks
  has_many :carts
  has_many :transactions
  has_many :comments
  has_many :favorites

  def welcome_send
    after_create :welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def artistname
    if username == nil
      artistname = "#{@first_name} #{@last_name}"
    else
      artistname = @username
    end
    return artistname
  end

end
