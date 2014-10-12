class RecruitersController < ApplicationController
  layout "recruiters"
  respond_to :json, :html
  def index
    # if user type is recruiter
    if isRecruiter?
      # get postings, notifications and load vars to pass for recruiter
      @mypostings = @current_user.postings
      @notifications = @current_user.getNotifications(@mypostings)
      
      # initialize all these variables to pass in hash
      @n_name=[]
      @n_email=[]
      @n_profile=[]
      @taglists=[]
      @links=[]

      # check if notifications exist and get info about notifications
      if @notifications
        @notifications.each do |n|
          @n_name << n.profile.applicant.name
          @n_email << n.profile.applicant.email
          @n_profile << n.profile
          # split by new lines, space and commas

          if n.profile.link!=nil
            @links << n.profile.link.split(/[,\s]+/)
          else
            @links << ""
          end
          @taglists << n.profile.tag_list.split(" ")
        end
      end

      # hash to pass through angular
      @hash = {postings: @mypostings.reverse, notifications: @notifications, tags: Tag.all, names: @n_name, emails: @n_email, profiles: @n_profile, taglists: @taglists, linkarray: @links}  
      respond_with(@hash)
    else
      redirect_to '/applicant'
    end
  end

  def isRecruiter?  
    @current_user.type =="Recruiter"
  end
end