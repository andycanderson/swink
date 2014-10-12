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

          # split by new lines, space and commas into arrays for ng-repeats
          # check if empty don't execute methods on nil or empty strings
          if n.profile.link != "" && n.profile.link!=nil
            @links << n.profile.link.split(/[,\s]+/)
          else
            @links << []
          end
          if n.profile.tag_list != "" && n.profile.tag_list != nil
            @taglists << n.profile.tag_list.split(" ")
          else
            @taglists << []
          end
        end 
      end

      # hash to pass through angular
      @hash = {postings: @mypostings.reverse, notifications: @notifications, tags: Tag.all, names: @n_name, emails: @n_email, profiles: @n_profile, taglists: @taglists, linkarray: @links}  
      respond_with(@hash)
    else
      redirect_to root_path
    end
  end

  def isRecruiter?
    if @current_user  
      @current_user.type =="Recruiter"
    else
      false
    end
  end
end