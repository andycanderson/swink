class ApplicantsController < ApplicationController
  def index
    myprofile = @current_user.profile

    @tags = myprofile.getTagArray

    @feed = []
    @feed = Posting.all.where(tag_id: )
  end
end
