class RecruitersController < ApplicationController
  layout "recruiters"
  respond_to :json, :html
  def index
    if isRecruiter?
      @mypostings = @current_user.postings
      @notifications = @current_user.getNotifications(@mypostings)
      @hash = {postings: @mypostings, notifications: @notifications, tag_list: @tag_list, tags: Tag.all}
      respond_with(@hash)
    else
      redirect_to '/applicant'
    end
  end

  def isRecruiter?  
    @current_user.type =="Recruiter"
  end
end
