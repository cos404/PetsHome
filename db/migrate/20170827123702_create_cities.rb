class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|

      t.integer :country_id

      t.string  :eng
      t.string  :rus
      t.string  :bel
      t.string  :fr
      t.string  :de
      t.string  :es

      t.timestamps
    end
  end
end
