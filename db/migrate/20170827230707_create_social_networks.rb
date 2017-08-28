class CreateSocialNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :social_networks do |t|

      t.string  :title
      t.string  :logotype
      t.string  :url

      t.timestamps
    end
  end
end
