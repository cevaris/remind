class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.text :comments
      t.boolean :completed
      t.datetime :notify_datetime
      t.string :prefered_contact

      t.timestamps
    end
  end
end
