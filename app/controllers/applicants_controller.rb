class ApplicantsController < ApplicationController
  layout "applicants"
  respond_to :json, :html

  def index
    if isApplicant? 
      # gets profile
      myprofile = @current_user.profile
      # gets tags to query postings for
      @tags = myprofile.getTagArray
      # gets postings for tags
      @feed = myprofile.getFeed(@tags)
      @liked = myprofile.getLiked
      @hashy = {myprofile: myprofile, tags: @tags, feed: @feed, liked: @liked}
      respond_with(@hashy)

    else
      redirect_to '/recruiter'
    end

    
  end

  def isApplicant?  
    @current_user.type =="Applicant"
  end
end
