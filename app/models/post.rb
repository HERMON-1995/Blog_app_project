class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def update_posts_count
    author.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
  validates :likes_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'must be an integer greater than or equal to zero.' }
end
