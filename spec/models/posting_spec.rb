require 'spec_helper' 

describe Posting do

	it "should have both a title and description" do
		posting = Posting.new(title: "Developer", description: "Now hiring")
		expect(posting).to be_valid 
	end

	it "should be invalid without both a title and description" do 
		posting = Posting.new(title: nil, description: "Now hiring")
		expect(posting).to_not be_valid
	end 


end