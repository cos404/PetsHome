class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|

      t.date    :birthday
      t.date    :euthanasia_date
      t.boolean :euthanasia, default: false
      t.boolean :sterilization
      t.boolean :vaccination
      t.integer :subspecies # 1 - Dog, 2 - Cat, 0 - Other
      t.integer :size # 1 - S, 2 - M, 3 - L
      t.integer :gender # 1 - Male, 2 - Female
      t.integer :user_id
      t.integer :shelter_id
      t.string  :name
      t.string  :color
      t.string  :avatar
      t.text    :diseases
      t.text    :about

      t.boolean :finished
      t.string  :finished_description

      t.integer :views, default: 0

      t.timestamps
    end
  end
end
