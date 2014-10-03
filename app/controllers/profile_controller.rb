class ProfileController < ApplicationController

  def showmine
    @profile = Profile.find_by(applicant_id: @current_user)
    @tag_list = @profile.tag_list
    @link = @profile.link
  end

  def update
    @current_user.profile.update(params.require(:patch).permit(:link, :tag_list))
    redirect_to applicant_home_path
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
