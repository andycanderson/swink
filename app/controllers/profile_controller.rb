class ProfileController < ApplicationController
  respond_to :json, :html

  def showmine
    # gets this when EDIT PROFILE is clicked
    @profile = Profile.find_by(applicant_id: @current_user)
    @tag_list = @profile.tag_list
    @link = @profile.link
    # @hashy = {profile: @profile}
    respond_with(@profile)
  end

  def update
   
    @current_user.profile.link = params[:link]
    @current_user.profile.tag_list = params[:tag_list]
    @current_user.profile.save
    respond_to do |format|
      format.json { head :ok }
    end
  end




  def search
    tags = params[:tags]
    # params[:search].each do |k , v|
    #   if v == "1"
    #     tags << k
    #   end
    # end
    @search_result = Profile.search(tags)
    
    render :json => @search_result.to_json
  end

  def seeprofile
    @profile = Profile.find(params[:id])
  end
end
