class ApplicantsController < ApplicationController
  def index
    myprofile = @current_user.profile
    binding.pry
    tags = myprofile.getTagArray
    # @feed = Posting.all.where(tag_id: )
  end
end
