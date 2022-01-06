class TeamScrimsController < ApplicationController
 
    def create(scrim)
        @team_scrim = TeamScrim.new
        @team_scrim.scrim = Scrim.find(scrim[:scrim])
        @team_scrim.team = Team.find(scrim[:team])
        @team_scrim.save
    end
end
