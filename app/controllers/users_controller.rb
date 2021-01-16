class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create

    end

    def show
        user = User.find_by(username: params[:username])
        if user.password == params[:password]
            render json: user
        else
            render json: {message: "Incorrect username or password"}
        end
    end

    def update

    end
end
