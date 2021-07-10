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
end
