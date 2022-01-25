class ComplaintsController < ApplicationController

    def new
        @complaint = Complaint.new
        @team = Team.find(params[:team].to_i)
    end

    def create
        @complaint = Complaint.new(complaint_params)
        @complaint.team = Team.find(params[:complaint][:team] .to_i)
        if @complaint.save
            redirect_to root_path()
        else
            render :new
        end
    end

    private

    def complaint_params
        params.require(:complaint).permit(:message)
    end
end
