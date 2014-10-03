class RecruitersController < ApplicationController
  def index
    
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
