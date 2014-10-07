class ProfileController < ApplicationController

  respond_to :json, :html

  def showmine
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
    # redirect_to applicant_home_path
    # @redirect = '/'
    # respond_with do |format|
    #   format.json { status :204 }
    # end

    respond_to do |format|
      format.json { head :ok }
    end
  end




  def search
      
    tags = []
    params[:search].each do |k , v|
      if v == "1"
        tags << k
      end
    end
    @search_result = Profile.search(tags)
  
    # this sends you to the search view in profile
  end

  def seeprofile
    @profile = Profile.find(params[:id])
  end
end
