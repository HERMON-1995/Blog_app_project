class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'comment created'
    else
      render 'posts/show'
    end
  end
end

  private

def comment_params
  params.require(:comment).permit(:text)
end
