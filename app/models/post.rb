class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_count

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.increment!(:posts_count)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
end