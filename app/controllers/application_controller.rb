class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action:configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
        added_attrs = [:email, :password, :password_confirmation, :comment, :is_admin, :is_artist, :username, :first_name, :last_name, :bio, :avatarpicture, :dateofbirth, :siret, :adress, :zipcode, :city, :country, :mobile, :fb_user_ID, :insta_user_ID]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  end

  