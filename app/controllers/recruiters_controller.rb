class RecruitersController < ApplicationController
  layout "recruiters"
  respond_to :json, :html
  def index
    # if user type is recruiter
    if isRecruiter?
      # get postings, notifications and load vars to pass for recruiter
      @mypostings = @current_user.postings
      @notifications = @current_user.getNotifications(@mypostings)
      @n_name=[]
      @n_email=[]
      @n_profile=[]

      # check if notifications exist
      if @notifications
        @notifications.each do |n|
          @n_name << n.profile.applicant.name
          @n_email << n.profile.applicant.email
          @n_profile << n.profile
        end
      end

      # hash to pass through angular
      @hash = {postings: @mypostings, notifications: @notifications, tags: Tag.all, names: @n_name, emails: @n_email, profiles: @n_profile}  
      respond_with(@hash)
    else
      redirect_to '/applicant'
    end
  end

  def isRecruiter?  
    @current_user.type =="Recruiter"
  end
end
