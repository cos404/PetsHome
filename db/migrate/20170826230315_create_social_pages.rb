class CreateSocialPages < ActiveRecord::Migration[5.1]
  def change
    create_table :social_pages do |t|

      t.integer :user_id
      t.string  :network_id
      t.string  :url

      t.timestamps
    end
  end
end
