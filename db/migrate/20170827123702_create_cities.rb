class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|

      t.integer :region_id
      t.integer :country_id
      t.string  :title

    end
  end
end