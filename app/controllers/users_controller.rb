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
      # direct to applicant or recruiter
      sendMeHome(user)
    else
      redirect_to root_path
    end
  end

  def sendMeHome user 
      if user.type =="Applicant"
        redirect_to "/applicant"
      else
        redirect_to "/recruiter"
      end
  end
end
