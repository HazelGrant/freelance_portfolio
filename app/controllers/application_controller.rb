class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user!
    if !logged_in? && !(current_user.id == 1)
      redirect_to root_path
      flash[:danger] = "Sorry, you don't belong there."
    end
  end

end
