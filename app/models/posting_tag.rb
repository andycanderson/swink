class PostingTag < ActiveRecord::Base
  belongs_to :posting
  belongs_to :tag
end
