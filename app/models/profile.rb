class Profile < ActiveRecord::Base
	has_many :postings, through: :likes
	has_many :likes
	belongs_to :applicant
end
