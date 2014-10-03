class ApplicantsController < ApplicationController
  def index
    
    # gets profile
    myprofile = @current_user.profile
    # gets tags to query postings for
    @tags = myprofile.getTagArray
    # gets postings for tags
    @feed = myprofile.getFeed(@tags)
    @liked = myprofile.postings

  end
end
