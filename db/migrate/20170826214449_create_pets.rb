class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|

      t.date    :birthday
      t.date    :euthanasia_date
      t.boolean :sterilization, default: false
      t.boolean :vaccination, default: false
      t.integer :subspecies, default: 0 # 0 - Dog, 1 - Cat, 2 - Other
      t.integer :size # 0 - S, 1 - M, 2 - L
      t.integer :gender, default: 0 # 0 - Male, 1 - Female
      t.integer :user_id
      t.integer :shelter_id
      t.string  :name
      t.string  :color
      t.string  :avatar
      t.text    :diseases
      t.text    :about
      t.integer :status, default: 0
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
