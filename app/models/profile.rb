class Profile < ActiveRecord::Base
  validates_presence_of :applicant_id
  belongs_to :applicant
  has_many :likes
  has_many :postings, through: :likes



  # this determines what gets queried by tag names
  def getTagArray
    # downcase and get taglist array of self
    if self.tag_list 
      tag_list = self.tag_list.downcase.split(" ")
    else
      tag_list = ""
    end
  end

  def getFeed tags
    feed=[]
    tags.each do |tag|
      search = Tag.find_by(name: tag) 
      begin
        feed << search.postings
      rescue
      end
    end
    feed = feed.flatten.uniq.sort

    # gets job created yesterday only
    feed_returned = []
    feed.map do |job|
      # if job.created_at.yday == Time.now.yday
    # if job.created_at.yday == Time.now.yday - 1
        feed_returned << job
      # end
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
    allprofiles = Profile.all
    allprofiles.each do |profile|
      if profile.tag_list != nil
        tags.each do |tag|
          if profile.tag_list.include? tag
            profiles << profile
          end 
        end
      end
    end
    # return all profiles that match the search tags
    profiles.uniq
  end
end