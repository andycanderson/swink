class CreateLikes < ActiveRecord::Migration
  def change

    create_join_table :applicants, :postings, table_name: :like

  end
end
