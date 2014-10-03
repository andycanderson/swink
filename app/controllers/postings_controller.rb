class PostingsController < ApplicationController
  def index
      @postings = Posting.all
    end

  def show
      @posting = Posting.find(params[:id])
  end

  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.new(posting_params)
      @Posting.like = current_user

      if @posting.save
        redirect_to @posting
      else
        render 'new'
      end

        @Posting.save
        redirect_to @posting
  end

  def edit
    @posting = Posting.find(params[:id])
  end


  def update
    @posting = Posting.find(params[:id])

    if @posting.update_attributes(posting_params)
      redirect_to posting_path(@posting)
    else
      render 'show'
    end
  end

  def destroy
    @posting = Posting.find(params[:id])
    @Posting.destroy
    redirect_to postings_path
  end



  private
    def posting_params
      params.require(:posting).permit(:title,:description,:like,:dislike,:recruiter_id)
    end
    # t.string   "title"
    # t.text     "description"
    # t.integer  "recruiter_id"
    # t.integer  "like"
    # t.integer  "dislike"
end
