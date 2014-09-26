class UsersController < ApplicationController
  def create
    # type indicates sub class of applicant or recruiter 
    user = User.new(params.require(:user).permit(:email, :name, :type, :password, :password_confirmation))
    user.email.downcase!
    user.name.downcase!
    # saves users email in downcase form
    if user.save
      # saves user id to session to start
      session[:user_id] = user.id.to_s
    else
      
    end
  end
end
