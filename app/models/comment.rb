class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_count
  after_destroy :reduce_comment_counter

  def update_comment_count
    post.increment!(:comment_counter)
  end

  def reduce_comment_counter
    post.decrement!(:comment_counter)
  end
end
