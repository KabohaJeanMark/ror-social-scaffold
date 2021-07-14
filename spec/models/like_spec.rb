require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) {User.create(name: 'jean', email: 'jean@gmail.com', password: '123456')}
  let(:post1) {Post.create(content: 'First post', user_id: user1.id)}

  it 'is not valid without valid attributes' do
    expect(Like.new).to_not be_valid
  end

  it 'is valid with proper attributes for user and post' do
    expect(Like.new(user_id: user1.id, post_id: post1.id ))
  end
end
