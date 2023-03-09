class CommentsController < ApplicationController
    def index
        if params[:user_id] # < this is the wildcard
            comments = Comment.comments_for_user(params[:user_id])
            render json: comments
        elsif params[:artwork_id]
            comments = Comment.comments_for_artwork(params[:artwork_id])
            render json: comments
        else
            comments = Comment.all
            render json: comments
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id) # < we are going to require certain params in this artwork
    end

end
