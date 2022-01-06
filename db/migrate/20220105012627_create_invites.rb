class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.date "date"
      t.time "time"
      t.timestamps
    end
  end
end
