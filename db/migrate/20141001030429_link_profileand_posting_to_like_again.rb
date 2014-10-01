class LinkProfileandPostingToLikeAgain < ActiveRecord::Migration
  def change
    remove_column :likes, :profile_id_id
    remove_column :likes, :posting_id_id

    add_reference :likes, :profile, index: true
    add_reference :likes, :posting, index: true
  end
end
