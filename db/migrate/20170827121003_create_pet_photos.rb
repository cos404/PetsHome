class CreatePetPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_photos do |t|

      t.string  :title
      t.integer :user_id
      t.integer :pet_id


      t.timestamps
    end
  end
end
