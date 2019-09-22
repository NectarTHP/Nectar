class ImagesController < ApplicationController
def create
    @artwork = Artwork.find(params[:artwork_id])
    @artwork.image.attach(params[:image])
    redirect_to(artwork_path(@artwork))
end
end


