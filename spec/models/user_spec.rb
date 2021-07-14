require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      user1 = User.new(name: 'jean', password: '123456', email: 'jean@example.com').save
      expect(user1).to eq(true)
    end
    it 'requires a password of atleast 6 digits' do
      user2 = User.new(name: 'dexter', password: '123', email: 'dex@example.com').save
      expect(user2).to eq(false)
    end
  end

  context 'association test' do
    it 'can have many posts' do
      u = User.reflect_on_association(:posts)
      expect(u.macro).to eq(:has_many)
    end
    it 'can have many comments' do
      u = User.reflect_on_association(:comments)
      expect(u.macro).to eq(:has_many)
    end
    it 'can have many friendships' do
      u = User.reflect_on_association(:friendships)
      expect(u.macro).to eq(:has_many)
    end
    it 'can have many inverse_friendships' do
      u = User.reflect_on_association(:inverse_friendships)
      expect(u.macro).to eq(:has_many)
    end
    it 'can have many likes' do
      u = User.reflect_on_association(:likes)
      expect(u.macro).to eq(:has_many)
    end
  end
end
