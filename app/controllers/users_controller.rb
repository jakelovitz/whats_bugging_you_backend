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
        @user = User.new(
            username: params["username"],
            password: params["password"],
            phone_number: params["phone_number"]
        )

        if @user.valid?
            @user.save
            token = JWT.encode_token({user_id: @user.id}, "supes_secret")
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: "Sorry buddy, someone snatched that username. Try another one!"}
        end

    end

    def edit
        @user = User.find(params["id"])
    end

    def update
        @user = User.find(params["id"])
        @user.assign_attributes(username: params["newUsername"], phone_number: params["newPhoneNumber"])

        if @user.valid?
            @user.update(username: params["newUsername"], phone_number: params["newPhoneNumber"])
            render json: @user
        else
            render json: {errors: "Sorry buddy, someone snatched that username. Try another one!"}
        end
    end

    private

    # def person_params
    #     params.require(:user).permit(:username, :password, :phone_number)
    # end

end
