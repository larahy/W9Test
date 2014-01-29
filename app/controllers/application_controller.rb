class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :nag_for_email

  def nag_for_email
    if user_signed_in? && current_user.email.blank? 
      flash[:error] = "Please edit your details to include email."
      redirect_to edit_user_registration_path
    end
  end

end
