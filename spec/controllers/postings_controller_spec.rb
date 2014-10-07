require 'rails_helper'

RSpec.describe PostingsController, :type => :controller do

	it "redirects to the new posting (post) page" do
		post :create 
		@postings = assigns(:postings) 
		expect(response).to have_http_status(302) 
	end

end
