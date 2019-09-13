class ApplicationController < ActionController::Base

before_action :configure_devise_parameters, if: :devise_controller?

def configure_devise_parameters

    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :comment, :is_admin, :is_artist, :username, :first_name, :last_name, :bio, :dateofbirth, :siret, :adress, :zipcode, :city, :country, :mobile, :fb_user_ID, :insta_user_ID)}

    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :comment, :is_admin, :is_artist, :username, :first_name, :last_name, :bio, :dateofbirth, :siret, :adress, :zipcode, :city, :country, :mobile, :fb_user_ID, :insta_user_ID)}

end
end

