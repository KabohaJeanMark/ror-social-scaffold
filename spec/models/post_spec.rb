require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user1) {User.create(name: 'jean', email: 'jean@gmail.com', password: '123456')}
  let(:post1) {Post.create(content: 'First post', user_id: user1.id)}
  let(:post2) {Post.create(content: '', user_id: user1.id)}
  context 'validation test' do
    it 'is valid with valid attributes' do
      expect(Post.new).to_not be_valid
    end

    it 'is not valid without content' do
      post = Post.new(content: nil)
      expect(post).to_not be_valid
    end

    it 'is valid with proper post content filled in' do
      expect(post1).to be_valid
    end

    it 'is not valid if the post content is blank' do
      expect(post2).to_not be_valid
    end
  end
  context 'association test' do
    it 'has many likes' do
      p = Post.reflect_on_association(:likes)
      expect(p.macro).to eq(:has_many)
    end
    it 'has many comments' do
      p = Post.reflect_on_association(:comments)
      expect(p.macro).to eq(:has_many)
    end
  end
end
