class AddingTitleandDescriptionToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :title, :string
    add_column :postings, :description, :text
  end
end
