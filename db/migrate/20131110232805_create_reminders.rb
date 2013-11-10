class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :description
      t.integer :user_id
      t.datetime :dispatch_time

      t.timestamps
    end
  end
end
