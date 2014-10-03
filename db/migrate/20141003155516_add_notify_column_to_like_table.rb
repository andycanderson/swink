class AddNotifyColumnToLikeTable < ActiveRecord::Migration
  def change
    add_column :likes, :notify, :boolean, default: false
  end
end
