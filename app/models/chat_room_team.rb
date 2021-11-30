class ChatRoomTeam < ApplicationRecord
    belongs_to :chat_rooms
    belongs_to :teams
end
