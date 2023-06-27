class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    if comments
      render json: { status: 'Success', message: 'Loaded Comments', data: comments }, status: :ok
    else
      render json: { status: 'Not Found', message: 'Details not found', data: comments.errors },
             status: :unprocessable_entity
    end
  end

  def create
    user = User.find(params[:user_id])
    current_post = Post.find(params[:post_id])
    comments = current_post.comments.new(comment_params)
    comments.post_id = current_post.id
    comments.author_id = user.id
    if comments.save
      render json: { status: 'Success', message: 'Comment Created', data: comments }, status: :ok
    else
      render json: { status: 'Not Found', message: 'Details not found', data: comments.errors },
             status: :unprocessable_entity
    end
  end

  def update
    comments = Comment.find(params[:id])
    if comments.update(comment_params)
      render json: { status: 'Success', message: 'Comment Updated', data: comments }, status: :ok
    else
      render json: { status: 'Not Found', message: 'Details not found', data: comments.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
    comments = Comment.find(params[:id])
    comments.destroy
    render json: { status: 'Success', message: 'Comment Deleted', data: comments }, status: :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
