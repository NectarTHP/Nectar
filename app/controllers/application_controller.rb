class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  before_action :set_cache_headers

  def after_sign_in_path_for(resource)
    artworks_path
  end

  private

  #Fix bug of javascripts not running when browsing to previous page
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
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
  