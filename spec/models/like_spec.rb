require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is not valid without valid attributes' do
    expect(Like.new).to_not be_valid
  end
end
