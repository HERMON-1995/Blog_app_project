class Api::V1::PostsController < ApplicationController
    skip_before_action :authenticate_user!
    protect_from_forgery with: :null_session
  
        def index
              user = User.find(params[:user_id])
              posts = user.posts
              render json: posts
        end
      
        def comments
              post = Post.find(params[:post_id])
              comments = post.comments
            #   render json: comments
        end
end
