class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|

      t.string  :title
      t.integer :country_id
      t.integer :region_id
      t.integer :city_id
      t.string  :street
      t.string  :house_number
      t.float   :latitude
      t.float   :longitude
      t.text    :about
      t.string  :cover

      t.boolean :working
      t.boolean :verified

      t.integer :user_id

      t.timestamps
    end
  end
end
