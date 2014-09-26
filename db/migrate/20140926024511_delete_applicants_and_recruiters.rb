class DeleteApplicantsAndRecruiters < ActiveRecord::Migration
  def change
    drop_table :applicants
    drop_table :recruiters
  end
end
