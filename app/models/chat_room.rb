class ChatRoom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_room_teams, dependent: :destroy
end
