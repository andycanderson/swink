class Profile < ActiveRecord::Base
  belongs_to :applicant
  has_many :postings, through: :likes
end
