class OrdersController < ApplicationController
  before_action :authenticate_user!

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
    @cart = Cart.find_by(user_id: current_user)
    puts "$"*60;puts "beginning of orders#create";puts "$"*60
  end

end