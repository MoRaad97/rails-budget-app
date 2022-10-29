require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    @user.save
  end
  it 'is valid' do
    recipe = Entity.new(name: 'Miso Paste', amount: 123, user_id: @user.id)
    expect(recipe).to be_valid
  end
  it 'should not be valid without a amount' do
    recipe = Entity.new(name: 'Miso Paste', amount: nil, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
  it 'should not be valid without a user ' do
    recipe = Entity.new(name: nil, amount: 123, user_id: nil)
    expect(recipe).to_not be_valid
  end
end
