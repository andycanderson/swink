class ProfileController < ApplicationController
  
  def new

  end

  def show
    @profile = Profile.find_by(applicant_id: @current_user)
  end
end
