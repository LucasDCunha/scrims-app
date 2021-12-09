class ChangePropsIndex < ActiveRecord::Migration[6.1]
  def change
    remove_column :team_scrims, :teams_id
    remove_column :team_scrims, :scrims_id
    add_reference :team_scrims, :team, index: true
    add_reference :team_scrims, :scrim, index: true

    remove_column :players, :teams_id
    add_reference :players, :team, index: true

    remove_column :messages, :team_id
    remove_column :messages, :chat_room_id
    add_reference :messages, :team, index: true
    add_reference :messages, :chat_room, index: true

    remove_column :favorites, :users_id
    remove_column :favorites, :teams_id
    add_reference :favorites, :team, index: true
    add_reference :favorites, :user, index: true

    remove_column :evaluations, :teams_id
    remove_column :evaluations, :scrims_id
    add_reference :evaluations, :team, index: true
    add_reference :evaluations, :scrim, index: true

    remove_column :chat_room_teams, :teams_id
    remove_column :chat_room_teams, :chat_rooms_id
    add_reference :chat_room_teams, :chat_room, index: true
    add_reference :chat_room_teams, :team, index: true
  end
end
