class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def after_sign_in_path_for(resource)
    artworks_path
  end

  protected

  #redirect to sign_in page is user tries to access page requiring authenticateed user
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'To do this you need to log in or to register'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
  