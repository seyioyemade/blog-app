require 'rails_helper'
RSpec.describe Post, type: :model do
  describe '#five_most_recent_comments method' do
    let(:user) { create(:user) }
    it 'it returns the last 5 comments of a post' do
      user = User.create(name: 'Seyi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Germany.')
      post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')

      first_comment = Comment.create(author_id: user.id, post_id: post.id, text: 'text')
      Comment.create(author_id: user.id, post_id: post.id, text: 'text')
      Comment.create(author_id: user.id, post_id: post.id, text: 'text')
      Comment.create(author_id: user.id, post_id: post.id, text: 'text')
      Comment.create(author_id: user.id, post_id: post.id, text: 'text')
      Comment.create(author_id: user.id, post_id: post.id, text: 'text')

      five_most_recent_comments = post.five_most_recent_comments

      expect(five_most_recent_comments).to_not include(first_comment)
    end
  end
  describe '#update_posts_counter method' do
    let(:user) { create(:user) }
    it 'it increments the posts_counter of a user' do
      user = User.create(name: 'Seyi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Germany.', posts_counter: 1)
      Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')

      expect(user.posts_counter).to eql 1
    end
  end
  describe 'validations' do
    it 'requires a title' do
      post = Post.new(title: nil)
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end
    it 'validates the maximum length of title' do
      post = Post.new(title: 'a' * 251)
      post.valid?
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end
    it 'validates numericality of comments_counter' do
      post = Post.new(comments_counter: 'invalid')
      post.valid?
      expect(post.errors[:comments_counter]).to include('is not a number')
    end
    it 'validates comments_counter is greater than or equal to 0' do
      post = Post.new(comments_counter: -1)
      post.valid?
      expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end
    it 'validates numericality of likes_counter' do
      post = Post.new(likes_counter: 'invalid')
      post.valid?
      expect(post.errors[:likes_counter]).to include('is not a number')
    end
    it 'validates likes_counter is greater than or equal to 0' do
      post = Post.new(likes_counter: -1)
      post.valid?
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
