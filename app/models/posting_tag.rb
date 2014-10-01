class PostingTag < ActiveRecord::Base
  belongs_to :postings
  belongs_to :tags
end
