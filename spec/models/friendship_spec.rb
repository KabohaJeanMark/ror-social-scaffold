require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation test' do
    it 'is not valid without valid params passed' do
      expect(Friendship.new).to_not be_valid
    end
  end
end