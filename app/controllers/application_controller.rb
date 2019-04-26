class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters

    added_attrs = [:email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def authenticate_user!
    
    if user_signed_in?
      redirect_to '/products'
    else
      # redirect_to your_path, notice: "Please Login to view that page!"
    end
  end

end
