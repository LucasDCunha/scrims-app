class TeamScrim < ApplicationRecord
    belongs_to :team
    belongs_to :scrim

    validates :team, presence: true
    validates :scrim, presence: true
end
