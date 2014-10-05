require 'spec_helper'

describe Recruiter do 
	it "should fail without a valid email" do
		recruiter = Recruiter.new(email: nil)
		expect(recruiter).to_not be_valid 
	end

	it "should fail without a valid name" do
		recruiter = Recruiter.new(name: nil)
		expect(recruiter).to_not be_valid 
	end

	it "should fail without a valid password_digest" do
		recruiter = Recruiter.new(password_digest: nil)
		expect(recruiter).to_not be_valid 
	end

	it "should fail without a valid type selected" do
		recruiter = Recruiter.new(type: nil)
		expect(recruiter).to_not be_valid 
	end

end 