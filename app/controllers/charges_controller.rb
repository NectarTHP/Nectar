class ChargesController < ApplicationController

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
      amount: @cart.cart_total,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    binding.pry #3

    @order = Order.new(user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name, email: current_user.email)
    @order.save
    @cart.line_items.each do |item|
      item.update(order_id: @order.id)
      item.update(cart_id: nil)
      puts item
    end
    
    binding.pry #4

    puts "$"*60;puts "Create order and empty cart code executed";puts "$"*60

  end #create

  puts "$"*60;puts "end of charges_controller#create";puts "$"*60

end