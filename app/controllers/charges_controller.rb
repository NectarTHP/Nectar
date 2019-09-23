class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    puts "$"*60;puts "beginning of charges_controller#new";puts "$"*60
    @cart = Cart.find_by(user_id: current_user)
    @order = Order.new
    puts "$"*60;puts "end of charges_controller#new";puts "$"*60
  end
  
  def create
    puts "$"*60;puts "beginning of charges_controller#create";puts "$"*60

    @cart = Cart.find_by(user_id: current_user)

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @cart.cart_total*100,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @order = Order.new(user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name, email: current_user.email)
    @order.save
    @cart.line_items.each do |item|
      item.update(order_id: @order.id)
      item.update(cart_id: nil)
      item.artwork.update(is_sold: true)
    end
        
    flash[:notice] = 'You payment was successfuly processed'


  end #create

end