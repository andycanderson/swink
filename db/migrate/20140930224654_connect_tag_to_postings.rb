class ConnectTagToPostings < ActiveRecord::Migration
  def change
    create_join_table :posting, :tag
  end
end
