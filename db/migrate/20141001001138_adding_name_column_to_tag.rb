class AddingNameColumnToTag < ActiveRecord::Migration
  def change
    add_column :posting_tags, :posting_id, :integer
    add_column :posting_tags, :tag_id, :integer
  end
end
