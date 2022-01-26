class ChatRoom < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :user
    belongs_to :team
end
