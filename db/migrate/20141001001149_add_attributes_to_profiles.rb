class AddAttributesToProfiles < ActiveRecord::Migration
  def change

  	add_column :profiles, :skills, :string
  	add_column :profiles, :tags, :string
  	add_column :profiles, :zipcode, :integer


  	add_column :profiles, :link1, :string
  	add_column :profiles, :link2, :string
  	add_column :profiles, :link3, :string

  end
end
