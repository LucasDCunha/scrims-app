class CreateChatRoomTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_room_teams do |t|
      t.references :teams, foreign_key: true
      t.references :chat_rooms, foreign_key: true
      t.timestamps
    end
  end
end
