class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|

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
