class AddApplicantReferenceToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :applicant, index: true
  end
end
