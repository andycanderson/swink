class AddingForeignKeyToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :recruiter_id, :integer 
  end
end
