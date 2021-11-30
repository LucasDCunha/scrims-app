class Message < ApplicationRecord
    belongs_to :chat_rooms
    belongs_to :teams
end
