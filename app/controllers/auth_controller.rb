class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        # byebug

        if user && user.authenticate(params[:password])

            token = JWT.encode({user_id: user.id}, "supes_secret")

            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: "you messed up goofball for shame"}
        end
    end

    def auto_login

        if session_user
            # render json: {user: UserSerializer.new(user), token: token}
            render json: session_user
            # if there's that bug again try stucturing this return like you did above
        else
            render json: {errors: "handz off my cookiez"}
        end

    end

end
