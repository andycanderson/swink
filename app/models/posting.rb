class Posting < ActiveRecord::Base
  belongs_to :recruiter
  has_many :applicants, through: :likes

  has_many :posting_tags
  has_many :tags, through: :posting_tags






  # changed this in migrations
  # sets likes and dislikes to zero
  # after_initialize :zero_out

  # def zero_out
  #   self.dislike = 0
  #   self.like = 0
  # end


end
