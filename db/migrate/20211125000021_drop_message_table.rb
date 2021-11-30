class DropMessageTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :message_tables
  end
end
