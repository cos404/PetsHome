class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|

      t.string  :title
      t.string  :country_id
      t.string  :city_id
      t.string  :street
      t.string  :house_number
      t.float   :latitude
      t.float   :longitude
      t.text    :description
      t.string  :cover

      t.boolean :working
      t.boolean :verified

      t.string  :user_id

      t.timestamps
    end
  end
end
