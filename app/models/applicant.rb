class Applicant < User
  has_many :postings, through: :likes
end
