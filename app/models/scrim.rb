class Scrim < ApplicationRecord
    has_many :evaluations
    has_many :team_scrims
end
