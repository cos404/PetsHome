class AddLookupCodeToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :lookup_code, :integer, default: 0
  end
end
