class InvitesController < ApplicationController
    before_action :set_invite, only: [:destroy]

    def index
        @invites = Invite.all.select { |t|
            t.invite_teams[0].team.user == current_user if t.invite_teams != []
        }
        @invite = Invite.new()
    end

    def create
        create_scrim(params[:invite][:invite]) if params[:invite][:invite] != nil

        if params[:invite][:invite] == nil
            @invite = Invite.new(invite_params)
            invite_teams_controller = InviteTeamsController.new
            if @invite.save
                invite_teams_controller.create(invite: @invite.id, team: params["invite"]["team1"])
                invite_teams_controller.create(invite: @invite.id, team: params["invite"]["team2"])
                flash[:success] = "Convite enviado com sucesso!"
                redirect_to search_team_path()
            else
                flash[:danger] = "Erro ao criar o convite!"
                redirect_to root_path()
            end
        end
    end

    def create_scrim(invite)
        scrim_controller = ScrimsController.new
        scrim_controller.create(invite)
        flash[:success] = "Convite aceito com sucesso!"
        redirect_to scrims_path()
    end

    def destroy(invite = nil)
        if invite == nil
            @invite = Invite.find(params[:id])
        else
            @invite = Invite.find(invite)
        end
        @invite.destroy
        redirect_to root_path() if invite == nil
    end

    private

    def set_invite
        @invite = Invite.find(params[:id])
    end

    def invite_params
        params.require(:invite).permit(:date, :time)
    end
end
