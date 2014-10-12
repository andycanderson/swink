class ApplicantsController < ApplicationController
  layout "applicants"
  respond_to :json, :html

  def index
    if isApplicant? 
      # gets profile
      myprofile = @current_user.profile
      # gets tags to query postings for
      # see if user has no tags
      if myprofile.getTagArray != ""
        @tags = myprofile.getTagArray.sort
        @feed = myprofile.getFeed(@tags)
      else
        @tags = ""
        @feed = ""
      end
      # gets postings for tags
      
      @liked = myprofile.getLiked
      @name = @current_user.name.downcase.split.map(&:capitalize).join(' ')
      @email = @current_user.email.downcase
      @alltags = tagNames
      # sends in hash
      @hashy = {myprofile: myprofile, tags: @tags, feed: @feed, liked: @liked, name: @name,email: @email,alltags: @alltags}
      respond_with(@hashy)

    else
      redirect_to root_path
    end

    
  end

  def isApplicant?
    if @current_user  
      @current_user.type =="Applicant"
    else
      false
    end
  end

  def tagNames
    tags = []
    Tag.all.each do |tag|
      tags << tag.name
    end
    tags
  end
end