class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :destroy, :update]

    ELOS = {
        0 => 'Sem elo',
        1 => 'FERRO', 2 => 'BRONZE', 3 => 'PRATA', 4 => 'OURO', 5 => 'PLATINA',
        6 => 'DIAMANTE', 7 => 'MESTRE', 8 => 'GRÃO-MESTRE', 9 => 'DESAFIANTE'
    }
    
    def index
        @teams = Team.all.select { |t|
            t.user == current_user
        }
        @elos = ELOS
        @invites = Invite.all.select { |t|
            t.invite_teams[0].team.user == current_user if t.invite_teams != []
        }
        @invite = Invite.new()
    end

    def search_team
        @teams = Team.all
        @favorite = Favorite.new()
        @favorites = Favorite.all.select {|t|t.user == current_user}
        @invite = Invite.new()
        @my_teams = Team.all.select { |t|
            t.user == current_user
        }
        @other_teams = @teams - @my_teams
    end

    def show
    end

    def edit
        @players = Player.all.select {|t|t.team == @team}
        @player = Player.new
        @elos = ELOS
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
        p @team
        if @team.update(team_params)
          redirect_to teams_path()
        else
          render :edit
        end
    end
    
    def destroy
        @team.destroy
        redirect_to root_path()
    end

    def recalc_grade(enemy)
        @team = Team.find(enemy)
        grade = 0
        @team.evaluations.each do |e|
            grade += e.grade
        end
        @team.grade = grade/@team.evaluations.count
        @team.save
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
