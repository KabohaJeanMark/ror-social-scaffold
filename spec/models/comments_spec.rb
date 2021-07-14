require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation test' do
    it 'is valid with content' do
      comment = Comment.new(content: 'The rain in Spain')
      expect(comment).to_not be_valid
    end

    it 'is not valid without content' do
      comment = Comment.new(content: nil)
      expect(comment).to_not be_valid
    end
  end
end
