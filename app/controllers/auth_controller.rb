class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        # byebug

        if user && user.authenticate(params[:password])

            # token = encode_token(user.id)

            render json: {user: UserSerializer.new(user)}
        else
            render json: {errors: "you messed up goofball for shame"}
        end
    end

    # def auto_login
    #     if session_user
    #         render json: session_user
    #     else
    #         render json: {errors: "cookies y'all"}
    #     end
    # end

end
