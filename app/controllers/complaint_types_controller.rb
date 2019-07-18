class ComplaintTypesController < ApplicationController

    def index
        @complaint_types = ComplaintType.all

        render json: @complaint_types
    end

end
