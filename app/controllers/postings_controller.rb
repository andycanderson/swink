class PostingsController < ApplicationController
  def new

  end

  def create    

    # adds tag documents to an array that are found
    tags = []
    params[:postingTagArray].each do |tag|        
      tags << Tag.find_by(name: tag)
    end

    # make posting belonging to this recruiter
    posting = @current_user.postings.new
    posting.title = params[:title]
    posting.description = params[:description]
    posting.save
    
    # for each tag document, make a posting_tag
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
