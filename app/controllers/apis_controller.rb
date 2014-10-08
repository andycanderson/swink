class ApisController < ApplicationController
  skip_before_action :is_logged_in?, :get_current_user
  respond_to :html, :xml, :json

  def index
    # for apis get all postings and return in json format
    @postings = Posting.all
    respond_with (@postings)
  end
end
