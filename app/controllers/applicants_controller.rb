class ApplicantsController < ApplicationController

  def index
    if isApplicant? 
      # gets profile
      myprofile = @current_user.profile
      # gets tags to query postings for
      @tags = myprofile.getTagArray
      # gets postings for tags
      @feed = myprofile.getFeed(@tags)
      @liked = myprofile.postings
    else
      redirect_to '/recruiter'
    end

  end

  def isApplicant?  
    @current_user.type =="Applicant"
  end
end
