class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|

      t.integer :shelter_id
      t.string  :phone_number
      t.string  :name

    end
  end
end
