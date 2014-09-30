class AddLikeAndDislikeToPost < ActiveRecord::Migration
  def change
    add_column :postings, :like, :integer
    add_column :postings, :dislike, :integer
  end
end
