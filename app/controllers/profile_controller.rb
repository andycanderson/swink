class ProfileController < ApplicationController
  respond_to :json, :html

  def showmine
    # gets this when EDIT PROFILE is clicked
    @profile = Profile.find_by(applicant_id: @current_user)
    respond_with(@profile)
  end

  def update
    # update profile when user patches
    params[:link] != nil && params[:link] != "" ? @current_user.profile.link = params[:link] : nil
    params[:tag_list] != nil && params[:tag_list] != "" ? @current_user.profile.tag_list = params[:tag_list].join(" ") : nil
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
    # setup empty arrays and load hash to pass back with results
    @names = []
    @emails = []
    @tag_lists = []
    @links = []
    @search_result.each do |profile|
      @names << profile.applicant.name
      @emails << profile.applicant.email
      # check if empty to avoid error on nil class
      if profile.link != "" && profile.link != nil
        @links << profile.link.split(/[,\s]+/)
      else
        @links << []
      end
      # check if empty to avoid error on nil class 
      if profile.tag_list != "" && profile.tag_list != nil
        @tag_lists << profile.tag_list.split(" ")
      else
        @tag_lists << []
      end 
    end
    @hash = {profiles: @search_result, names: @names, emails: @emails, tag_lists: @tag_lists, links: @links}
    # return results in json
    render :json => @hash.to_json
  end

  def seeprofile
    @profile = Profile.find(params[:id])
  end
end
