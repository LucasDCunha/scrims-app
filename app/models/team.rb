class Team < ApplicationRecord
    belongs_to :users
    has_many :team_scrims, dependent: :destroy
    has_many :players, dependent: :destroy
    has_many :scrims, through: :team_scrims
    has_many :messages, dependent: :destroy
    has_many :evaluations, dependent: :destroy
    has_many :chat_room_teams, dependent: :destroy
    has_many :chat_rooms, through: :chat_room_teams
end
