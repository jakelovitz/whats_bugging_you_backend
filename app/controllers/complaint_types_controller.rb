class ComplaintTypesController < ApplicationController

    def index
        @complaint_types = ComplaintType.all

        render json: @complaint_types
    end

    def create
        complaint_type = ComplaintType.new(
            user_id: params["userId"],
            name: params["complaintType"],
            color: params["complaintColor"],
            disabled: false
        )
        # byebug
        complaint_type.save

        render json: complaint_type
    end

    def edit
        @complaint_type = ComplaintType.find(params["id"])
    end

    def update
        # byebug
        @complaint_type = ComplaintType.find(params["id"])
        @complaint_type.update(user_id: params["userId"], name: params["complaintTypeName"], color: params["complaintTypeColor"], disabled: true)

        render json: @complaint_type
    end

    def destroy
        # byebug
        @complaint_type = ComplaintType.find(params["id"])
        
        @complaints = @complaint_type.complaints
        
        # byebug
        @complaints.each do |complaint|
            if complaint.reactions.length === 1
                complaint.reactions[0].destroy
            end
        end
        
        @complaints.each do |complaint|
            complaint.destroy
        end
        
        @complaint_type.destroy

        @user_complaints = []
        # byebug
        Complaint.all.each { |complaint|
            if complaint.complaint_type.user.id === params["userId"]
                @user_complaints.push(complaint)
            end
        }
        
        # byebug
        render json: @user_complaints
    end

    private

    # def complaint_type_params
    #     params.require(:complaint_type).permit(:user_id, :name, :color)
    # end

end
