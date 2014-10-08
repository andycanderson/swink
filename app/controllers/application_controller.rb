class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # get current_user and check if logged in
  before_action :get_current_user
  before_action :is_logged_in? 

  def get_current_user
    # if current user exists, otherwise escape error
    begin
      # if the user is logged in via sessions
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    rescue
    end
  end

  def is_logged_in?
    # check if logged in
    if !session[:user_id]
      redirect_to root_path
    end
  end


end
