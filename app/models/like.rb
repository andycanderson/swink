class Like < ActiveRecord::Base
	belongs_to :profile
	belongs_to :posting
end
