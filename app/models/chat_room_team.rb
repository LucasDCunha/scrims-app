class ChatRoomTeam < ApplicationRecord
    belongs_to :chat_room
    belongs_to :team
end
