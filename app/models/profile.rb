class Profile < ActiveRecord::Base
  belongs_to :applicant
  has_many :postings, through: :likes


  # this determines what gets queried
  def getTagArray
    arr = []
    # downcase and get taglist of self
    tag_list = self.tag_list.downcase 
    if tag_list.include? "c++"
      arr << "c++"
    end
    if tag_list.include? "objective-c"
      arr << "objective-c"
    end
    if tag_list.include? "ruby on rails"
      arr << "ruby on rails"
    end
    if tag_elist.include? "javascript"
      arr << "javascript"
    end
    arr
  end

  def getFeed tags
  


  end
end
