class CreatePostingTags < ActiveRecord::Migration
  def change
    create_table :posting_tags do |t|

      t.timestamps
    end
  end
end
