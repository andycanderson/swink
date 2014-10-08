require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

	it "returns success when logging out (delete) and redirects to root_path" do
      delete :destroy
      expect(response).to have_http_status(302)
    end

    it "returns success when creating (post) a new session and redirects accordingly" do
      post :create
      expect(response).to have_http_status(302)
    end

end
