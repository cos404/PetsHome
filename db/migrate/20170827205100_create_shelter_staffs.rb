class CreateShelterStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :shelter_staffs do |t|

      t.integer :user_id
      t.integer :shelter_id
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
