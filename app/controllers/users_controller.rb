class UsersController < ApplicationController
  skip_before_action :is_logged_in?
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
      sendMeHomeAndCreateProfile(user)
    else
      redirect_to root_path
    end
  end

  def sendMeHomeAndCreateProfile user 
      if user.type == "Applicant"
        Profile.create(applicant_id: user.id)
        redirect_to "/myprofile"
      else
        redirect_to "/recruiter"
      end
  end
end
