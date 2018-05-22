class CreateShelterPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :shelter_photos do |t|

      t.string  :title
      t.integer :user_id
      t.integer :shelter_id


      t.timestamps
    end
  end
end
