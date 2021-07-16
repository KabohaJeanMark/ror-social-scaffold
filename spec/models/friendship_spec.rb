require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create(name: 'jean', email: 'jean@gmail.com', password: '123456') }
  let(:user2) { User.create(name: 'mark', email: 'mark@gmail.com', password: '123456') }

  context 'validation test' do
    it 'is not valid without valid params passed' do
      expect(Friendship.new).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(Friendship.new(user_id: user1.id, friend_id: user2.id)).to be_valid
    end
  end

  context 'instance methods' do
    describe '#confirmation' do
      it 'checks if the friend confirmation works' do
        friendship = Friendship.new(user_id: user1.id, friend_id: user2.id, confirmed: false)
        friendship.confirmation
        expect(user1.friend?(user2)).to be true
      end
    end 
  end
end
