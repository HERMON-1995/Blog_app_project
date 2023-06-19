class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_count

  def update_comment_count
    post.increment!(:comment_counter)
  end
end
