class ComplaintsController < ApplicationController

    def index
        @complaints = Complaint.all

        render json: @complaints
    end

    def create
        # person_params
        # byebug
        complaint = Complaint.new(
            complaint_type_id: params["complaintTypeId"],
            severity: params["complaintSeverity"],
            complaint_text: params["complaintText"]
            # complaint_params
        )
        complaint.save

        render json: complaint
    end

    def user_complaints
        @user_complaints = []
        
        # byebug
        Complaint.all.each { |complaint|
            if complaint.complaint_type.user.id === params["user_id"]
                @user_complaints.push(complaint)
            end
        }

        render json: @user_complaints
    end

    def destroy
        # byebug
        @complaint = Complaint.find(params["id"])

        @reactions = @complaint.reactions

        @reactions.each do |reaction|
            reaction.destroy
        end

        @complaint.destroy

        render json: Complaint.all
    end

    def edit
        @complaint = Complaint.find(params["id"])
    end

    def update
        # byebug
        @complaint = Complaint.find(params["id"])
        @complaint.update(complaint_type_id: params["newComplaintType"], severity: params["newComplaintSeverity"], complaint_text: params["newComplaintText"])

        render json: @complaint
    end

end

private

# def complaint_params
#     params.require(:complaint).permit(complaint_type_id: params["complaintTypeId"], severity: params["complaintSeverity"], complaint_text: params["complaintText"])
# end