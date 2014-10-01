class Post < ActiveRecord::Base
	field :name, type: String
	field :description, type: String
	
	belongs_to :recruiter
end
