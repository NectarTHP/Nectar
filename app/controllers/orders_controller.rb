class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = Cart.find_by(user_id: current_user)

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    redirect_to root_path
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :adress)
    end

end