class ProfileController < ApplicationController
  
  def new

  end

  def show
    @profile = Profile.find_by(applicant_id: @current_user)
    @tag_list = @profile.tag_list
    @link = @profile.link
  end

  def update
    @current_user.profile.update(params.require(:patch).permit(:link, :tag_list))
    redirect_to applicant_home_path
  end
end
