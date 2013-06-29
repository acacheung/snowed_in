require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.build(:user)}

  # it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }

  it { should allow_value('requester').for(:role) }
  it { should allow_value('shoveler').for(:role) }
  it { should_not allow_value('panda').for(:role) }

  # it { should allow_value('').for(:state) }
  # it { should allow_value('MA').for(:state) }
  # it { should_not allow_value(0).for(:state) }
  # it { should_not allow_value('meow').for(:state) }

  # it { should allow_value('02461').for(:zipcode) }
  # it { should_not allow_value(0).for(:zipcode) }
  # it { should_not allow_value('meow').for(:zipcode) }

  it { should have_many(:work_requests) }
  it { should have_many(:bids) }
end
