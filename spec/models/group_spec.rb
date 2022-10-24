require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    @user.save
  end
  it 'is valid' do
    recipe = Group.new(name: 'Miso Paste', icon: 'Test', user_id: @user.id)
    expect(recipe).to be_valid
  end
  it 'should not be valid without a amount' do
    recipe = Group.new(name: 'Miso Paste', icon: nil, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
  it 'should not be valid without a user ' do
    recipe = Group.new(name: nil, icon: 123, user_id: nil)
    expect(recipe).to_not be_valid
  end
end
