class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|

      t.integer :type # 1 -Dog, 2 - Cat, 0 - Other
      t.float   :age  # 01.12 - 1 year 12 mounth
      t.string  :name
      t.boolean :euthanasia, default: false
      t.date    :euthanasia_date
      t.string  :size
      t.text    :vaccination
      t.text    :diseases
      t.boolean :sterilization
      t.string  :color
      t.string  :avatar
      t.text    :about

      t.integer :user_id
      t.integer :shelter_id

      t.integer :views, default: 0

      t.timestamps
    end
  end
end
