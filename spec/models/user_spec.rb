require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.build(:user)}

  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:role) }

  it { should allow_value('requester').for(:role) }
  it { should allow_value('shoveler').for(:role) }
  it { should_not allow_value('panda').for(:role) }

  it 'state will not submit if state is longer than two letters' do
    user.state = 'Meow'
    expect(user).to_not be_valid
  end

  it 'zipcode will not submit if it is not a number with five digits' do
    user.zipcode = 'Meow'
    expect(user).to_not be_valid
  end
end
