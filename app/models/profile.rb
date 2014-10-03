class Profile < ActiveRecord::Base
  belongs_to :applicant
  has_many :likes
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

    # gets job created yesterday only
    feed_returned = []
    feed.map do |job|
      if job.created_at.yday == Time.now.yday - 1
        feed_returned << job
      end
    end

    # this deletes all postings the user has dis/liked
    feed_returned = feed_returned - self.postings 
  end

# returns list of liked jobs
  def getLiked
    self.postings.where(like: true)
  end

  def self.search tags
    profiles = []
    allprofiles = Profile.all()
    allprofiles.each do |profile|
      tags.each do |tag|
        if profile.tag_list.include? tag.downcase
          profiles << profile
        end 
      end
    end
    # return all profiles that match the search tags
    profiles.uniq
  end
end
