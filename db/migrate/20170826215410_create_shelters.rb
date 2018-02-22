class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|

      t.string  :title
      t.integer :country_id
      t.integer :region_id
      t.integer :city_id
      t.string  :street
      t.string  :house_number
      t.float   :latitude, default: 0.0
      t.float   :longitude, default: 0.0
      t.text    :about
      t.string  :cover
      t.boolean :moderation, default: false
      t.boolean :verified, default: false
      t.integer :status, default: 0

      t.integer :user_id

      t.timestamps
    end
  end
end
