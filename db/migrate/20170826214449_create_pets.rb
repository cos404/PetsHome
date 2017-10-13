class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|

      t.integer :subspecies # 1 - Dog, 2 - Cat, 0 - Other
      t.integer :age_years
      t.integer :age_months
      t.date    :birthday
      t.string  :name
      t.boolean :euthanasia, default: false
      t.date    :euthanasia_date
      t.integer :size # 1 - S, 2 - M, 3 - L
      t.integer :gender # 1 - Male, 2 - Female
      t.text    :vaccination
      t.text    :diseases
      t.boolean :sterilization
      t.string  :color
      t.string  :avatar
      t.text    :about
      t.integer :user_id
      t.integer :shelter_id
      t.integer :cover

      t.boolean :finished
      t.string  :finished_description

      t.integer :views, default: 0

      t.timestamps
    end
  end
end
