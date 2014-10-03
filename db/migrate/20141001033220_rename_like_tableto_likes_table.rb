class RenameLikeTabletoLikesTable < ActiveRecord::Migration
  def change
  	rename_table :like, :likes
  end
end
