require 'rails_helper'

RSpec.describe RecruitersController, :type => :controller do

	it "renders (get) recruiter index" do
		@recruiters = assigns(:recruiters) 
		expect(response).to have_http_status(:success) 
	end

end