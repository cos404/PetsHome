class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|

      t.string  :title_en
      t.string  :title_ru
      t.string  :title_be
      t.string  :title_fr
      t.string  :title_de
      t.string  :title_es

      t.timestamps
    end
  end
end
