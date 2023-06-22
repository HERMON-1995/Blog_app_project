class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_posts_count

  after_destroy :reduce_posts_counter

  def update_posts_count
    author.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end

  def reduce_posts_counter
    author.decrement!(:post_counter)
  end
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
  validates :likes_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
end
