class AddingApplicantIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :applicant_id, :integer
  end
end
