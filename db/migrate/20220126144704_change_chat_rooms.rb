class ChangeChatRooms < ActiveRecord::Migration[6.1]
  def change
    drop_table :chat_room_teams

    add_reference :chat_rooms, :team, index: true
    add_reference :chat_rooms, :user, index: true

    remove_column :messages, :team_id
    add_reference :messages, :user, index: true
  end
end
