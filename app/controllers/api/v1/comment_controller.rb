class Api::V1::CommentController < ApplicationController
    def index
        comments = Comment.all
        render json: comments, status: :ok
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: :created
        else
            render json: {error: comment.errors}, status: :not_acceptable
        end
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment, status: :ok
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(text: comment_params[:text], post_id: comment_params[:post_id], user_id: comment_params[:user_id])
            render json: comment, status: :accepted
        else
            render json: {error: comment.errors}, status: :not_acceptable
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {message: 'comment successfully deleted'}, status: :no_content
    end

    private
    def comment_params
        params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
