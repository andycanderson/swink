class PostingsController < ApplicationController
  def new

  end

  def create
    
    tags = []
    params[:posting].each do |k, v|
      if k != "title" && k != "description" && v == "1"
        tags << Tag.find_by(name: k)
      end
    end

    posting = @current_user.postings.create(params.require(:posting).permit(:title, :description))
    tags.each do |tag|
      posting.posting_tags.create(tag_id: tag.id)
    end

    redirect_to '/newposting'
  end
  
  def edit

  end

  def delete

  end
end
