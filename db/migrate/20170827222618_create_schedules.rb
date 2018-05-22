class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|

      t.integer :shelter_id
      t.integer :day_of_week
      t.time    :open
      t.time    :close

      t.timestamps
    end
  end
end
