class Api::V1::PostController < ApplicationController
    def index
        posts = Post.all
        render json: posts, status: :ok
    end

    def create
        post = Post.new(post_params)
        if post.save
            render json: post, status: :created
        else
            render json: {error: post.errors}, status: :not_acceptable
        end
    end

    def show
        post = Post.find(params[:id])
        render json: post, status: :ok
    end

    def update
        post = Post.find(params[:id])
        if post.update(title: post_params[:title], content: post_params[:content], user_id: post_params[:user_id])
            render json: post, status: :accepted
        else
            render json: {error: post.errors}, status: :not_acceptable
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: {message: 'post successfully deleted'}, status: :no_content
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
