class ApplicantsController < ApplicationController
  def index
    myprofile = @current_user.profile

    @tags = myprofile.getTagArray


    @feed = []
    # @feed = Posting.all.where(tag_id: )
    @tags.each do |tag|
      search = Tag.find_by(name: tag.capitalize) 
      @feed << search.postings
    end
    @feed = @feed.flatten.uniq.sort
  end
end
