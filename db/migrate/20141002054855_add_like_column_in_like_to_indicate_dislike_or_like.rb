class AddLikeColumnInLikeToIndicateDislikeOrLike < ActiveRecord::Migration
  def change
    add_column :likes, :like, :boolean
    remove_column :postings, :dislike
    remove_column :postings, :like
    add_column :postings, :like, :integer, default: 0
    add_column :postings, :dislike, :integer, default: 0
  end
end
