class Recruiter < User
  has_many :postings

  def getNotifications recruiterpostings
    notifications = []
    recruiterpostings.each do |posting|
      notifications << posting.likes.where(notify: true)
    end
    
    notifications.flatten!

    # add .profile when iterating each to get profile
  end


end
