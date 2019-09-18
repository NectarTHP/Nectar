class ArtworksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  before_action :is_owner_or_admin, only: [:edit, :update, :destroy]

  def index
    @artworks = Artwork.unsold
  end

  def show
    #Already set by set_artwork
  end

  def new
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:user_id, :name, :description, :price, :picture_url, :categorie, :weight, :size, :sale, :tag)
    end

    def is_owner_or_admin
      unless current_user.id == @artwork.user_id || current_user.is_admin == true
        flash[:alert] = "Only the artist owning this artwork can modify it."
        redirect_to root_path
      end
    end
end
