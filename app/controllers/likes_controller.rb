class LikesController < ApplicationController
  respond_to :json, :html


  def likesave
    # make like and add to stats on posting
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: true, notify: true)
    post = Posting.find(params[:id])
    post.like += 1
    post.save    
    
    redirect_to applicant_home_path    
  end

  def dislikesave
    # make like and add to stats on posting
    Like.create(posting_id: params[:id], profile_id: @current_user.profile.id, like: false)
    post = Posting.find(params[:id])
    post.dislike += 1
    post.save
    
    redirect_to applicant_home_path
  end

  def removenotification
    # remove notification when recruiter sees profile
    like = Like.find(params[:id])
    like.update(notify: false)
    redirect_to seeprofile_path(like.profile_id)
  end
end
