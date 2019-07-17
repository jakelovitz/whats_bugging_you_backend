class UsersController < ApplicationController

    def index
        @users = User.all

        render json: @users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        # person_params
        # byebug
        user = User.new(
            username: params["username"],
            password: params["password"],
            phone_number: params["phone_number"]
        )
        user.save

        render json: user
    end

    private

    # def person_params
    #     params.require(:user).permit(:username, :password, :phone_number)
    # end

end
