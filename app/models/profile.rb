class Profile < ActiveRecord::Base
	has_many :postings, through: :likes
	belongs_to :applicant
end
