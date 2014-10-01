class Removing < ActiveRecord::Migration
  def change
    drop_table :posting_tag

    add_column :profiles, :link, :string
    add_column :profiles, :tag_list, :string
  end
end
