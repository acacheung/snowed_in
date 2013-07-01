require 'spec_helper'

describe Request do

  it { should validate_presence_of(:requester) }
  it { should validate_presence_of(:job_size) }
  it { should validate_presence_of(:offer) }
  it { should validate_presence_of(:state) }

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

  describe 'near' do
    it 'returns requests near the shoveler' do
      requester = FactoryGirl.create(:requester, address: '21 Hargrave Circle Newton, MA')
      shoveler = FactoryGirl.create(:shoveler, address: '19 Hargrave Circle Newton, MA')
      request = FactoryGirl.create(:request, requester: requester)

      results = Request.near(shoveler)
      results.should include(request)
    end

    it 'ignores requests further than five miles from the shoveler' do
      requester = FactoryGirl.create(:requester, address: '21 Hargrave Circle Newton, MA')
      shoveler = FactoryGirl.create(:shoveler, address: '33 Newbury Ave Methuen, MA')
      request = FactoryGirl.create(:request, requester: requester)

      results = Request.near(shoveler)
      results.should be_empty
    end

    it 'ignores requests that are not open' do
      requester = FactoryGirl.create(:requester, address: '21 Hargrave Circle Newton, MA')
      shoveler = FactoryGirl.create(:shoveler, address: '19 Hargrave Circle Newton, MA')
      request = FactoryGirl.create(:request, requester: requester)
      cancelled_request = FactoryGirl.create(:request, requester: requester, state: 'cancelled')

      results = Request.near(shoveler)
      results.should include(request)
      results.should_not include(cancelled_request)
    end
  end

end
