class SessionsController < ApplicationController

  def new
  end

  def create
    # if errors out because email not found short circuit authentication
    begin
      user = User.find_by(email: params[:email].downcase)
    rescue
      user = false
    end

    if user && user.authenticate(params[:password])
      # sets user.id to a key in session
      session[:user_id] = user.id.to_s
      # brings user to their home page
      binding.pry
    else
      
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
