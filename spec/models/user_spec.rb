require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid' do
    user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    expect(user).to be_valid
  end
  it 'should not be valid without passwords are matched' do
    user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_4567)
    expect(user).to_not be_valid
  end
  it 'should not be valid without a name ' do
    user = User.new(name: nil, email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    expect(user).to_not be_valid
  end
  it 'should not be valid without a email ' do
    user = User.new(name: 'Test', email: nil, password: 123_456, password_confirmation: 123_456)
    expect(user).to_not be_valid
  end
  it 'should not be valid without a correct email ' do
    user = User.new(name: 'Test', email: 'Email', password: 123_456, password_confirmation: 123_456)
    expect(user).to_not be_valid
  end
end
