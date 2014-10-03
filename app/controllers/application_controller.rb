class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # protect_from_forgery with: :exception
  # before_action :get_current_user
  # before_action :is_logged_in? 

  # def get_current_user
  #   # if current user exists
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #   end
  # end

  # def is_logged_in?
  #   if !session[:user_id]
  #     redirect_to root_path
  #   end
  # end


end
