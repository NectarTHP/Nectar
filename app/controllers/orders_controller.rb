class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_orders = Order.all.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.all.where(order_id: @order.id)
  end

  def new
    @cart = Cart.find_by(user_id: current_user)
    @order = Order.new
  end

  def create
    @cart = Cart.find_by(user_id: current_user)
  
  end



end