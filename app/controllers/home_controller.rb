class HomeController < ApplicationController
  skip_before_action :is_logged_in?, :get_current_user
  def index
    
  end
end
