class UsersController < ApplicationController
  def create
    binding.pry
    user = User.new(params.require(:user).permit(:email, :name, :type, :password, :password_confirmation))
    # saves users email in downcase form
    if user.save
      # saves user id to session
      session[:user_id] = user.id.to_s
    else
      
    end
  end
end
