class ProfileController < ApplicationController
  respond_to :json, :html

  def showmine
    # gets this when EDIT PROFILE is clicked
    @profile = Profile.find_by(applicant_id: @current_user)
    # tag list is string
    @tag_list = @profile.tag_list
    @link = @profile.link
    respond_with(@profile)
  end

  def update
    # update profile when user patches
    params[:link] != nil && params[:link] != "" ? @current_user.profile.link = params[:link] : @current_user.profile.link = ""
    params[:tag_list] != nil && params[:tag_list] != "" ? @current_user.profile.tag_list = params[:tag_list].join(" ") : @current_user.profile.tag_list = ""
    @current_user.profile.save

    # rewrites header to resolve 500 error
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def search
    # gets tags from serach
    tags = params[:tags]
    # search profiles for matching tags
    @search_result = Profile.search(tags)
    # setup and load hash to pass back with results
    @names = []
    @emails = [];
    @search_result.each do |profile|
      @names << profile.applicant.name
      @emails << profile.applicant.email
    end
    @hash = {profiles: @search_result, names: @names, emails: @emails}
    # return results in json
    render :json => @hash.to_json
  end

  def seeprofile
    @profile = Profile.find(params[:id])
  end
end
