class InviteTeamsController < ApplicationController

    def create(invite)
        @invite_team = InviteTeam.new
        @invite_team.invite = Invite.find(invite[:invite])
        @invite_team.team = Team.find(invite[:team])
        @invite_team.save
    end
end
