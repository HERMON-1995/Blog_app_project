require 'cancancan'

class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])

    if can? :destroy, @post
      @post.destroy
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully deleted.'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'You are not authorized to delete this post.'
    end
  end

  def create
    @user = current_user
    @post = @user.posts.new(title: params[:post][:title], text: params[:post][:text])

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end
end
