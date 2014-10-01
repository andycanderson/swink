class LinkProfileandPostingToLike < ActiveRecord::Migration
  def change
    add_reference :likes, :profile_id, index: true
    add_reference :likes, :posting_id, index: true
    
  end
end
