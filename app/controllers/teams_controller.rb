class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :destroy]
    
    def index
        @teams = Team.all.select {|t|t.user == current_user}
    end

    def show
    end

    def edit
    end

    def new
        @team = Team.new
    end
    
    def create
        @team = Team.new(team_params)
        @team.user = User.find(1)
        if @team.save
            redirect_to root_path()
          else
            render :new
          end
    end

    def update
        if @team.update(team_params)
          redirect_to team_path(params[:id])
        else
          render :edit
        end
    end
    
    def destroy
        @team.destroy
        redirect_to root_path
    end

    private

    def set_team
        @team = Team.find(params[:id])
    end

    def team_params
        params.require(:team).permit(:name)
    end

    def filter_teams

    end

end
