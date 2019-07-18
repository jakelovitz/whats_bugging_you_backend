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

    private

    # def complaint_type_params
    #     params.require(:complaint_type).permit(:user_id, :name, :color)
    # end

end
