class CreateShelterComments < ActiveRecord::Migration[5.1]
  def change
    create_table :shelter_comments do |t|

      t.integer :user_id
      t.integer :shelter_id
      t.integer :body

      t.timestamps
    end
  end
end
