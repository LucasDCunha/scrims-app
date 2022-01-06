class Invite < ApplicationRecord
    has_many :invite_teams, dependent: :destroy
    has_many :teams, through: :invite_teams
end
