class EvaluationsController < ApplicationController

    def new
        @scrim = TeamScrim.find(params[:format].to_i).scrim
        @enemy = @scrim.team_scrims.select {|t| t.team.user != current_user}
        @evaluation = Evaluation.new()
    end

    def create
        @evaluation = Evaluation.new(evaluation_params)
        @evaluation.team = Team.find(params[:evaluation][:team].to_i)
        @evaluation.scrim = Scrim.find(params[:evaluation][:scrim].to_i)
        @evaluation.save if check_evaluation(@evaluation)
        enemy = @evaluation.scrim.team_scrims.select {|t| t.team.user != current_user}.first.team.id
        TeamsController.new.recalc_grade(enemy)
        flash[:success] = "Time avaliado com sucesso!"
        redirect_to root_path()
    end

    private

    def evaluation_params
        params.require(:evaluation).permit(:grade)
    end

    def check_evaluation(ev)
        ev = ev
        Evaluation.all.each do |evaluation|
            return false if evaluation.team.id == ev.team.id && evaluation.scrim.id == ev.scrim.id
            
        end
        return true
    end
end
