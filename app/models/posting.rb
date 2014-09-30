class Posting < ActiveRecord::Base
  belongs_to :recruiter

  after_initialize :zero_out

  def zero_out
    self.dislike = 0
    self.like = 0
  end


end
