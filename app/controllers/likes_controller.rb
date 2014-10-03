class LikesController < ApplicationController
  def likesave
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: true, notify: true)
    post = Posting.find(params[:id])
    post.notify = true
    post.like += 1
    post.save    

    # temp redirect to job list
    redirect_to applicant_home_path    
  end

  def dislikesave
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: false)
    post = Posting.find(params[:id])
    post.dislike += 1
    post.save

    # temp redirect to job list
    redirect_to applicant_home_path
  end

  def removenotification
    # patch to this method to remove notification
    # make routes to here
  
    like = Like.find(params[:id])
    like.update(notify: false)
    redirect_to seeprofile_path(like.profile_id)
  end
end
