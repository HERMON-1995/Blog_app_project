class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments, dependent: :destroy

  after_save :update_post_counter

  after_destroy :reduce_post_counter

  def update_posts_count
    author.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end

  def reduce_posts_counter
    author.decrement!(:post_counter)
  end

end
