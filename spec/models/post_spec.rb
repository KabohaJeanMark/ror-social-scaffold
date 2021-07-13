require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation test' do
    it 'is valid with valid attributes' do
      expect(Post.new).to_not be_valid
    end

    it 'is not valid without content' do
      post = Post.new(content: nil)
      expect(post).to_not be_valid
    end
  end
end
