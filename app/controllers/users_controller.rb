class UsersController < ApplicationController
  puts '$'*60; puts "'users_controller' has been called"; puts '$'*60

  before_action :authenticate_user!

  def index
    puts '$'*60; puts "'users#index' has been called";puts '$'*60
    @users = User.all
  end

  def show
        @user = User.find(params[:id])
        @artworks = @user.artworks 
            flash[:notice] = "Please complete your profil or press the skip button to complete your profil later"
             
  end

  def update
    @users = User.find(params[:id])
      if @users.update(list_params)
        redirect_to artworks_path
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
    puts '$'*60; puts "users_controller#authenticate_user' has been called"; puts '$'*60
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end

    def is_logged_user
      puts '$'*60; puts "users_controller#is_logged_user' has been called"; puts '$'*60
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


  private
  def list_params
    params.require(:user).permit(:FB_user_ID, :insta_user_ID, :mobile, :country, :city, :comment, :is_artist, :is_admin, :avatarpicture, :siret, :username, :bio, :first_name, :last_name, :dateofbirth, :zipcode, :adress, :password, :password_confirmation, :encrypted_password )
  end
end