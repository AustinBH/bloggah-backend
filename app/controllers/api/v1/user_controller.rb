class Api::V1::UserController < ApplicationController

    def index
        users = User.all
        render json: users, status: :ok
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: {error: user.errors}, status: :not_acceptable
        end
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def update
        user = User.find(params[:id])
        if user.update(username: user_params[:username], password: user_params[:password], avatar_url: user_params[:avatar_url])
            render json: user, status: :accepted
        else
            render json: {error: user.errors}, status: :not_acceptable
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {message: 'User successfully deleted'}, status: :no_content
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :avatar_url)
    end
end
