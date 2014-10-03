class RecruitersController < ApplicationController
  def index

    # fetch postings - with notifications 
    # display the profiles they are attached to
    # remove notification recruiter
    # views profile

    @mypostings = @current_user.postings
    

    @notifications = @current_user.getNotifications(@mypostings)
    # @mypostings.each do |posting|
    #   if posting.likes !=[]
    #     @notifications = end
    #   likes
    # end
  end
end
