class LineItem < ApplicationRecord
  belongs_to :artwork
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def line_item_price
    return self.artwork.price
  end

end