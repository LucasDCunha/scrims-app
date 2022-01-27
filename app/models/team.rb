class Team < ApplicationRecord
    belongs_to :user
    has_many :team_scrims, dependent: :destroy
    has_many :players, dependent: :destroy
    has_many :scrims, through: :team_scrims
    has_many :messages, dependent: :destroy
    has_many :evaluations, dependent: :destroy
    has_many :chat_rooms, dependent: :destroy
    has_many :invites, through: :invite_teams
    has_many :invite_teams, dependent: :destroy
    has_many :complaints, dependent: :destroy
    has_many :messages, through: :chat_rooms, dependent: :destroy
end
