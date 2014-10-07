require 'rails_helper'

RSpec.describe ApplicantsController, :type => :controller do

	it "renders (get) applicant index" do
		@applicants = assigns(:applicants) 
		expect(response).to have_http_status(:success) 
	end

end
