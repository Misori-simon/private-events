require 'rails_helper'

RSpec.describe User do
  let(:user1) { User.create(name: 'Tim') }
  let(:user2) { User.create }
  let(:user3) { User.create(name: '') }

  it 'Checks validity of user1' do
    expect(user1.valid?).to be true
  end

  it 'Checks validity of user2 without name' do
    expect(user2.valid?).to be false
  end

  it 'Checks validity of user3 with empty name' do
    expect(user3.valid?).to be false
  end

  it 'Checks validity of user4 with same name as user1' do
    User.create(name: 'Tim')
    expect(User.create(name: 'Tim').valid?).to be false
  end
end
