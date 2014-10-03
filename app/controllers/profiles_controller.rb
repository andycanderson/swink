class ProfilesController < ApplicationController

	def index
  		@profiles = Profile.all
  	end

  	def show
  		@profile = Profile.find(params[:id])
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
	  	@profile.like = current_user

			if @profile.save
				redirect_to @profile
			else
				render 'new'
			end

			  @profile.save
	  		redirect_to @profile
	end

	def edit
		@profile = Profile.find(params[:id])
	end


	def update
		@profile = Profile.find(params[:id])

		if @profile.update_attributes(profile_params)
			redirect_to profile_path(@profile)
		else
			render 'show'
		end
	end

	def destroy
		@profile = Profile.find(params[:id])
		@profile.destroy
		redirect_to profiles_path
	end



  private
  	def profile_params
    	params.require(:profile).permit(:skills,:tags,:zipcode,:link1,:link2,:link3,:applicant_id)
  	end
#     t.string   "skills"
	# t.string   "tags"
	# t.integer  "zipcode"
	# t.string   "link1"
	# t.string   "link2"
	# t.string   "link3"
	# t.integer  "applicant_id"
end
