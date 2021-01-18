class PostsController < ApplicationController
    def index
        posts = Post.all
        posts_arr = []
        posts.each do |post|
            if !post.private # the post is not private
                images = [] # store all the images
                post.images.each do |i|
                    image = rails_blob_path(i) # get the image
                    images << image # store it in the images array
                end
                posts_arr << {post: post, images: images} # store post with images in the array
            end
        end
        render json: posts_arr
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def show
        posts = Post.where(user_id: params[:user_id]) # find all the posts by the user_id
        posts_arr = []
        posts.each do |post| # for each post
            # byebug
            # get all the images associated with the post
            images = []
            post.images.each do |i|
                image = rails_blob_path(i)
                images << image
            end
            posts_arr << {post: post, images: images} # put the post with images in the arr
        end

        render json: {posts: posts_arr}
    end

    def update
        # byebug
        post = Post.find(params[:id])
        post.update(images: params[:images])
    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :points, :tag, :private, :user_id)
    end
end
