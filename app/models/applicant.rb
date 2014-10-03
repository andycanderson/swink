class Applicant < User
  # has_many :postings, through: :likes
  has_one :profile
end
