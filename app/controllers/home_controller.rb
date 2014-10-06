class HomeController < ApplicationController
  layout "login"
  skip_before_action :is_logged_in?
  
  def index
    if @current_user
      sendMeHome(@current_user)
    end
  end

   def sendMeHome user 
      if user.type == "Applicant"
        redirect_to "/applicant"
      else
        redirect_to "/recruiter"
      end
  end
end
