class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :destroy]
    
    def index
        @teams = Team.all.select { |t|
            t.user == current_user
        }

        @elos = {
            1 => 'FERRO', 2 => 'BRONZE', 3 => 'PRATA', 4 => 'OURO', 5 => 'PLATINA',
            6 => 'DIAMANTE', 7 => 'MESTRE', 8 => 'GRÃO-MESTRE', 9 => 'DESAFIANTE'
        }
    end

    def search_team
        @teams = Team.all
    end

    def show
    end

    def edit
        @players = Player.all.select {|t|t.team == @team}
        @player = Player.new
    end

    def new
        @team = Team.new
    end
    
    def create
        @team = Team.new(team_params)
        @team.user = current_user
        @team.number_off_athletes = 0
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
        redirect_to root_path()
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
