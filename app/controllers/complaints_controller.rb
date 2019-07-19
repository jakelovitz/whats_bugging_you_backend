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

end

private

# def complaint_params
#     params.require(:complaint).permit(complaint_type_id: params["complaintTypeId"], severity: params["complaintSeverity"], complaint_text: params["complaintText"])
# end