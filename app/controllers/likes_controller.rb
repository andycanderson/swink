class LikesController < ApplicationController
  def likesave
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: true)
    Posting.find(params[:id]).like += 1

    # temp redirect to job list
    redirect_to applicant_home_path    
  end

  def dislikesave
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: false)
    Posting.find(params[:id]).dislike += 1

    # temp redirect to job list
    redirect_to applicant_home_path
  end
end
