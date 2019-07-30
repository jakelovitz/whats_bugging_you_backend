class ComplaintTypesController < ApplicationController

    def index
        @complaint_types = ComplaintType.all

        render json: @complaint_types
    end

    def create
        complaint_type = ComplaintType.new(
            user_id: params["userId"],
            name: params["complaintType"],
            color: params["complaintColor"]
        )
        # byebug
        complaint_type.save

        render json: complaint_type
    end

    def edit
        @complaint_type = ComplaintType.find(params["id"])
    end

    def update
        byebug
        @complaint_type = ComplaintType.find(params["id"])
        @complaint_type.update(user_id: params["userId"], name: params["complaintTypeName"], color: params["complaintTypeColor"])

        render json: @complaint_type
    end

    def destroy
        # byebug
        @complaint_type = ComplaintType.find(params["id"])

        @complaints = @complaint_type.complaints

        @complaints.each do |complaint|
            complaint.destroy
        end

        @complaint_type.destroy

        render json: ComplaintType.all
    end

    private

    # def complaint_type_params
    #     params.require(:complaint_type).permit(:user_id, :name, :color)
    # end

end
