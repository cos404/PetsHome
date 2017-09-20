class CreatePetComments < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_comments do |t|

      t.integer :user_id
      t.integer :pet_id
      t.integer :body

      t.timestamps
    end
  end
end
