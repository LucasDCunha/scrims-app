class Scrim < ApplicationRecord
    has_many :evaluations
    has_many :team_scrims

    validates :level, presence: true
    validates :date, presence: true
    validates :time, presence: true
end
