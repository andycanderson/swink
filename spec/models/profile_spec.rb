require 'rails_helper'

# RSpec.describe Profile, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Profile do 

	it "should have a valid id" do 
		profile = Profile.new(applicant_id: nil)
		expect(profile).to_not be_valid
	end

end
