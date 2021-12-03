class EditMessagesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :team2_id
    remove_column :messages, :team_id
    add_column :messages, :chat_room_id, :integer
    add_column :messages, :team_id, :integer
    add_foreign_key :messages, :chat_rooms
    add_foreign_key :messages, :teams
  end
end
