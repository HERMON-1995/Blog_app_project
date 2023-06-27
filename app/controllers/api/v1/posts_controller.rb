class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    user = User.find(params[:user_id])
    posts = user.posts
    render json: { status: 'Success', message: 'Loaded posts', data: posts }, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.new(post_params)
    if post.save
      render json: { status: 'Success', message: 'Post Created', data: post }, status: :ok
    else
      render json: { status: 'Error', message: 'Failed to create post', data: post.errors },
             status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: { status: 'Success', message: 'Post Updated', data: post }, status: :ok
    else
      render json: { status: 'Error', message: 'Failed to update post', data: post.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { status: 'Success', message: 'Post Deleted', data: post }, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
