require 'rails_helper'

RSpec.describe ProfileController, :type => :controller do

	it "redirects to the show profile page" do 
		get :showmine
		expect(response).to have_http_status(302)
	end

end
