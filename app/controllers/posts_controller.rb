class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def show
        post = Post.find_by(title: params[:title])
        if post.user_id == params[:user_id]
            render json: post
        else
            render json: {message: "You do not have access to this post"}
        end
    end

    def update

    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :points, :tag, :user_id)
    end
end
