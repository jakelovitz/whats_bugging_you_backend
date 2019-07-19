class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        # byebug

        if user && user.authenticate(params[:password])

            # token = encode_token(user.id)

            render json: user
        else
            render json: {errors: "you messed up goofball for shame"}
        end
    end

    def auto_login
        # byebug

        id = request.headers["Authorization"]

        user = User.find_by(id: id)

        if user
            render json: user
        else
            render json: {errors: "handz off my cookiez"}
        end

        # if session_user
        #     render json: session_user
        # else
        #     render json: {errors: "cookies y'all"}
        # end
    end

end
