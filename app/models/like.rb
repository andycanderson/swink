class Like < ActiveRecord::Base
  belongs_to :posting
  belongs_to :profile
end
