class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def order_total
    sum = 0
    self.line_items.each do |line_item|
      if line_item.artwork.price == nil
        line_item.artwork.price = 1
      end
      sum+= line_item.artwork.price
    end
    return sum
  end

end
