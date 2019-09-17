class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def cart_total
    sum = 0
    self.line_items.each do |line_item|
      if line_item.artwork.price == nil
        line_item.artwork.price = 1
      end
      sum+= line_item.artwork.price
    end
    return sum
  end
  
  def current_cart
    Cart.where(user_id: current_user.id)
  end

  def destroy
    self.line_items.each do |line_item|
      line_item.destroy
    end
  end

end
