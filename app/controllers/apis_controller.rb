class ApisController < ApplicationController
  skip_before_action :is_logged_in?, :get_current_user
  respond_to :html, :xml, :json

  def index
    @postings = Posting.all
    respond_with (@postings)
  end
end
