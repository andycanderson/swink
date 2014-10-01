class RenameApplicantIdFromLikeTable < ActiveRecord::Migration
  def change
  	rename_column :like, :applicant_id, :profile_id
  end
end
