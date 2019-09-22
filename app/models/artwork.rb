class Artwork < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_one_attached :image

  def is_sold?
    self.is_sold
  end

  def self.sold
    self.where(is_sold: true)
  end

  def self.unsold
    self.where(is_sold: false)
  end

end
