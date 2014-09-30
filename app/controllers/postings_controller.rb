class PostingsController < ApplicationController
  def new

  end

  def create

    posting = @current_user.postings.create(params.require(:posting).permit(:title, :description))
    
    # tags = params[:postings][:tags] 
    binding.pry
    redirect_to '/newposting'
  end

  def edit

  end

  def delete

  end
end
