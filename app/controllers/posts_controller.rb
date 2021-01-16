class PostsController < ApplicationController
    def index
        posts = Post.all
        posts_arr = []
        posts.each do |post|
            images = [] # store all the images
            post.images.each do |i|
                image = rails_blob_path(i) # get the image
                images << image # store it in the images array
            end
            posts_arr << {post: post, images: images} # store post with images in the array
        end
        render json: posts_arr
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def show
        post = Post.find_by(user_id: params[:user_id]) # find the post by the user_id
        # if post.user_id == params[:user_id] # if the post has the same user_id as the user attempting to access it
        #     render json: post # render it
        # else
        #     render json: {message: "You do not have access to this post"} # otherwise let the user know they do not have permission
        # end

        # get all the images associated with the post
        images = []
        post.images.each do |i|
            image = rails_blob_path(i)
            images << image
        end
        render json: {post: post, images: images}

        # TODO: update to handle getting multiple posts associated with a single user_id
    end

    def update

    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :points, :tag, :user_id)
    end
end
