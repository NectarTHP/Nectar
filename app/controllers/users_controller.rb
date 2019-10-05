class UsersController < ApplicationController
  

  before_action :authenticate_user!

  def index
    
    @users = User.all
    unless current_user.is_admin
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end

  def show
    @artwork = Artwork.with_attached_images
    @artworkss = Artwork.new
    

    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      print e
    end
    if e.nil? == false
      redirect_to root_path
    else
    @artworks = @user.artworks
      unless current_user.id == @user.id
        redirect_to root_path
      end
    end
  end

  def update
    @users = User.find(params[:id])
      if @users.update(list_params)
        redirect_back(fallback_location: root_path)
      else
        render :edit
    end
 end

 def update_password
  @users = User.find(params[:id])
  if @users.update(list_params)
    redirect_to artworks_path
  else
    render :edit
end
end

  def edit
    @users = User.find(params[:id])
  end

  def authenticate_user
    
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end

    def is_logged_user
     
      unless current_user.id == params[:id].to_i
        flash[:danger] = "You can only visit your profile."
        redirect_to root_path
      end
  end
  
  def is_connected?(user)
    if current_user == user
      return true
    end
    false
  end

  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html {redirect_back fallback_location: artworks_path, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    # Create the user from params
    @user = User.new(user_params)
    if @user.save
      redirect_to(@user, :notice => 'User created')
    
    else
      render :action => 'new'
    end
  end


  private
  def list_params
    params.require(:user).permit(:FB_user_ID, :insta_user_ID, :mobile, :country, :city, :comment, :is_artist, :is_admin, :avatarpicture, :siret, :username, :bio, :first_name, :last_name, :dateofbirth, :zipcode, :adress, :password, :password_confirmation, :encrypted_password )
  end
end