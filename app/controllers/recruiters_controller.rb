class RecruitersController < ApplicationController
  def index
    
    @mypostings = @current_user.postings
  end

  def search_results
    # searches based on tags input and returns postings
    # that matches
    
  end
end
