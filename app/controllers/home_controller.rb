class HomeController < ApplicationController
  
  # use login layout
  layout "login"
  # skip check for login
  skip_before_action :is_logged_in?
  
  def index
    # if user is logged in skip login
    if @current_user
      sendMeHome(@current_user)
    end
  end

   # send to the respective homes of applicants or recruiters 
   def sendMeHome user 
      if user.type == "Applicant"
        redirect_to "/applicant"
      else
        redirect_to "/recruiter"
      end
  end
end
