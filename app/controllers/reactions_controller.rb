class ReactionsController < ApplicationController
    
    def index
        @reactions = Reaction.all

        render json: @reactions
    end

    def create
        # byebug
        reaction = Reaction.new(
            complaint_id: params["complaintId"],
            user_id: params["userId"],
            updated_severity: params["reactionSeverity"],
            cooldown_thoughts: params["reactionText"]
            # complaint_params
        )
        reaction.save

        render json: reaction
    end

end
