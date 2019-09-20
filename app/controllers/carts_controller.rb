class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find_by(user_id: current_user)
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user)
    line_items = LineItem.where(cart_id: @cart.id)
    line_items.each do |item|
      item.destroy
    end
    redirect_to artworks_path
  end
    
end
