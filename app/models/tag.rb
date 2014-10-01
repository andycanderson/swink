class Tag < ActiveRecord::Base

  has_many :posting_tags
  has_many :postings, through: :posting_tags
end
