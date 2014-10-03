class AddApplicantReferenceToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :applicant, index: true
  end
end

# how to add a foreign key to a table via migration
# rails g migration AddApplicantReferenceToProfile applicant:references
