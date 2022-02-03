class ComplaintsController < ApplicationController

    def new
        @complaint = Complaint.new
        @team = Team.find(params[:team].to_i)
    end

    def create
        @complaint = Complaint.new(complaint_params)
        @complaint.team = Team.find(params[:complaint][:team] .to_i)
        if @complaint.save
            flash[:success] = "Reclamacao craida com sucesso!"
            redirect_to root_path()
        else
            flash[:danger] = "Erro ao criar a reclamacao com sucesso!"
            render :new
        end
    end

    private

    def complaint_params
        params.require(:complaint).permit(:message)
    end
end
