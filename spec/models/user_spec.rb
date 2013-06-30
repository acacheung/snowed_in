require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.build(:user)}

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:role) }

  it { should allow_value('panda@panda.com').for(:email) }
  it { should_not allow_value('panda').for(:email) }

  it { should allow_value('requester').for(:role) }
  it { should allow_value('shoveler').for(:role) }
  it { should_not allow_value('panda').for(:role) }

  it { should have_many(:work_requests) }
  it { should have_many(:bids) }
end
