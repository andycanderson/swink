class LikesController < ApplicationController

	def index
		@likes = Like.all
		@profile = profile.find(params[:profile_id])
	end

	def show
		@profile = profile.find(params[:profile_id])
		@like = Like.find(params[:id])
	end

	def new
		@like = Like.new
		@profile = profile.find(params[:profile_id])
	end

	def create
		@like = Like.new(like_params)
		@Like.profile = profile.find(params[:profile_id])
		if @Like.save
			redirect_to likes_path
		else
			render 'new'
		end
	end

	def edit
		@profile = profile.find(params[:profile_id])
		@like = Like.find(params[:id])
	end

	def update
		@like = Like.find(params[:id])

		if @Like.update_attributes(like_params)
			redirect_to likes_path
		else
			render 'edit'
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@Like.destroy
		redirect_to likes_path
	end

  private
  	def like_params
    	params.require(:like).permit(:profile_id,:posting_id)
  	end

end
