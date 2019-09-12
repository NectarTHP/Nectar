class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :index]

  # GET /carts
  # GET /carts.json
  def index
    @cart = Cart.where(user_id: current_user.id)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart_line = Cart.find(params[:id])
  end

  # GET /carts/new
  def new
    puts "$"*60; puts "cart#new called";puts "$"*60
    @cart = Cart.where(user_id: current_user.id)
    @selected_artwork = Cart.where(user_id: current_user.id).where(artwork_id: params[:format].to_i)
    
    if @selected_artwork.empty? == false
      redirect_to(carts_path, alert: 'This artwork is already in your cart.')
      return
    end
    Cart.create(user_id: current_user.id, artwork_id: params[:format])
    redirect_to carts_path
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart_line = Cart.find(params[:id])
    @cart_line.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.where(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :artwork_id)
    end
end
