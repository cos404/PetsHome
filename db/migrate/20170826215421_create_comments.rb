class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.integer :user_id
      t.integer :post_id
      t.integer :body

      t.timestamps
    end
  end
end
