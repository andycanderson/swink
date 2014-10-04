class RecruitersController < ApplicationController

  def index
    if isRecruiter?
      @mypostings = @current_user.postings
      @notifications = @current_user.getNotifications(@mypostings)
    else
      redirect_to '/applicant'
    end
  end

  def isRecruiter?  
    @current_user.type =="Recruiter"
  end
end
