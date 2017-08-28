class CreateShelterRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :shelter_regions do |t|

      t.integer :shelter_id
      t.integer :region_id

      t.timestamps
    end
  end
end
