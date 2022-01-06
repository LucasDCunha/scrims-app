class InviteTeam < ApplicationRecord
    belongs_to :team
    belongs_to :invite
end
