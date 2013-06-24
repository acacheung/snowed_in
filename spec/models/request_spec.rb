require 'spec_helper'

describe Request do

  it { should validate_presence_of(:job_size) }
  it { should validate_presence_of(:offer) }
  it { should validate_presence_of(:requester) }

  it { should belong_to(:requester) }
  it { should belong_to(:shoveler) }

  it { should allow_value('small').for(:job_size) }
  it { should allow_value('medium').for(:job_size) }
  it { should allow_value('big').for(:job_size) }
  it { should_not allow_value('panda').for(:job_size) }

  it { should allow_value(0).for(:offer) }
  it { should allow_value(20).for(:offer) }
  it { should_not allow_value(-500).for(:offer) }
  it { should_not allow_value('panda').for(:offer) }

  # context 'when volunteer' do
  #   let(:request) {FactoryGirl.build(:request)}
  #   let(:requester) {FactoryGirl.build(:requester)}

  #   it 'should return true if request is for volunteers' do
  #     request.volunteer?.should be_true
  #   end
  # end
end
