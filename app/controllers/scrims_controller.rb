class ScrimsController < ApplicationController
    before_action :set_scrim, only: [:show, :destroy]

    def index
        @teams = Team.all.select {|t|t.user == current_user}
    end
    
    def create
        team_scrim_controller = TeamScrimsController.new
        @scrim = Scrim.new(scrim_params)
        if buscar_scrim()
            if @scrim.save
                team_scrim_controller.create(scrim: @scrim.id, team: params["scrim"]["team"])
                redirect_to root_path()
            else
                redirect_to root_path()
            end
        else
            redirect_to root_path()
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

    def buscar_scrim
        team_scrim_controller = TeamScrimsController.new
        @scrims = Scrim.all
        scrim_ideal = @scrims.select {|s| s.date == @scrim.date && s.time == @scrim.time && s.level == @scrim.level}
        if scrim_ideal.count > 0
            team_scrim_controller.create(scrim: scrim_ideal[0].id, team: params["scrim"]["team"])
            return false
        else
            return true
        end
    end
end
