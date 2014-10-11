class ApplicantsController < ApplicationController
  layout "applicants"
  respond_to :json, :html

  def index
    if isApplicant? 
      # gets profile
      myprofile = @current_user.profile
      # gets tags to query postings for
      @tags = myprofile.getTagArray.sort
      # gets postings for tags
      @feed = myprofile.getFeed(@tags)
      @liked = myprofile.getLiked
      @name = @current_user.name.downcase.split.map(&:capitalize).join(' ')
      @email = @current_user.email.downcase
      @alltags = tagNames
      # sends in hash
      @hashy = {myprofile: myprofile, tags: @tags, feed: @feed, liked: @liked, name: @name,email: @email,alltags: @alltags}
      respond_with(@hashy)

    else
      redirect_to '/recruiter'
    end

    
  end

  def isApplicant?  
    @current_user.type =="Applicant"
  end

  def tagNames
    tags = []
    Tag.all.each do |tag|
      tags << tag.name
    end
    tags
  end
end