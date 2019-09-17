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
    
    puts "$"*60;puts "beginning of strip code in orders#create";puts "$"*60

    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @cart.cart_total,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    
  puts "$"*60;puts "end of strip code in orders#create";puts "$"*60

    @order = Order.new(user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name, email: current_user.email)
    @cart.line_items.each do |item|
      item.order_id = @order.id
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