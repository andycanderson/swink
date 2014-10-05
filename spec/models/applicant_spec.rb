 require 'spec_helper'

 describe Applicant do 
	it "should fail without a valid email" do
		applicant = Applicant.new(email: nil)
		expect(applicant).to_not be_valid 
	end

	it "should fail without a valid name" do
		applicant = Applicant.new(name: nil)
		expect(applicant).to_not be_valid 
	end

	it "should fail without a valid password_digest" do
		applicant = Applicant.new(password_digest: nil)
		expect(applicant).to_not be_valid 
	end

	it "should fail without a valid type selected" do
		applicant = Applicant.new(type: nil)
		expect(applicant).to_not be_valid 
	end

end