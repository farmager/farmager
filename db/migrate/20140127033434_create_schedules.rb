class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
