class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.string  :title
      t.text    :body
      t.boolean :visibility, default: true
      t.boolean :verified, default: false
      t.integer :views, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
