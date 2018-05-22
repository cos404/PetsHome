class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|

      t.integer :country_id
      t.string  :title

    end
  end
end
