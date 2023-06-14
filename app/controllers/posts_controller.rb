class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @posts = User.find(params[:user_id]).posts.find(params[:id])
    # @comments = @post.comments
  end
end
