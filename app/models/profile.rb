class Profile < ActiveRecord::Base
  belongs_to :applicant
  has_many :postings, through: :likes

  def getTagArray
    arr = []
    tag_list = self.tag_list.downcase 
    if tag_list.include? "c++"
      arr << "c++"
    end

    arr
  end
end
