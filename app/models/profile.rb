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
    if tag_list.include? "javascript"
      arr << "javascript"
    end
    arr
  end

  def getFeed tags
    feed=[]
    tags.each do |tag|
      search = Tag.find_by(name: tag.capitalize) 
      feed << search.postings
    end
    feed = feed.flatten.uniq.sort
  end
end
