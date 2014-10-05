require 'spec_helper' 

describe User do 
	it "should fail without a valid email" do
		user = User.new(email: nil)
		expect(user).to_not be_valid 
	end

	it "should fail if email doesn't match regex" do 
		user = User.new(email: /^.+@\w+.[a-z]+.[a-z]+$/.to_s)
		expect(user).to_not be_valid
	end

	it "should fail without a valid name" do
		user = User.new(name: nil)
		expect(user).to_not be_valid 
	end

	it "should fail without a valid password_digest" do
		user = User.new(password_digest: nil)
		expect(user).to_not be_valid 
	end

	it "should fail without a valid type selected" do
		user = User.new(type: nil)
		expect(user).to_not be_valid 
	end

end
