class ScrimsController < ApplicationController
    before_action :set_scrim, only: [:show, :destroy]

    def index
        @teams = Team.all.select {|t|t.user == current_user}
    end
    
    def create(invite = nil)
        create_scrim_by_invite(invite) if invite != nil

        if invite == nil
            team_scrim_controller = TeamScrimsController.new
            @scrim = Scrim.new(scrim_params)
            team_id = params[:scrim][:team].to_i
            if buscar_scrim(team_id)
                if @scrim.save
                    team_scrim_controller.create(scrim: @scrim.id, team: params["scrim"]["team"])
                    flash[:success] = "Scrim criada com sucesso!"
                    redirect_to root_path()
                else
                    flash[:danger] = "Erro ao criar scrim!"
                    redirect_to root_path()
                end
            else
                redirect_to root_path()
            end
        end
    end

    def destroy
        @scrim.destroy
        redirect_to root_path()
    end

    private

    def set_scrim
        @scrim = Scrim.find(params[:id])
    end

    def scrim_params
        params.require(:scrim).permit(:date, :time, :level)
    end

    def buscar_scrim(team_id)
        team_scrim_controller = TeamScrimsController.new
        @scrims = Scrim.all
        scrim_ideal = @scrims.select {|s| s.date == @scrim.date && s.time == @scrim.time && s.level == @scrim.level}
        if scrim_ideal.count > 0
            scrim_ideal.each_with_index do |scrim, index|
                if scrim.team_scrims.count < 2
                    team_scrim_controller.create(scrim: scrim_ideal[index].id, team: team_id)
                else
                    return true
                end
            end
            return false
        else
            return true
        end
    end

    def create_scrim_by_invite(invite)

        @invite = Invite.find(invite.to_i)
        team_scrim_controller = TeamScrimsController.new
        @scrim = Scrim.new()
        @scrim.date = @invite.date
        @scrim.time = @invite.time
        @scrim.level = 1
        @scrim.save
        team_scrim_controller.create(scrim: @scrim.id, team: @invite.invite_teams[0].team.id)
        team_scrim_controller.create(scrim: @scrim.id, team: @invite.invite_teams[1].team.id)

        invite_controller = InvitesController.new
        invite_controller.destroy(@invite.id)
    end
end
