require 'spec_helper'
require 'request_cleaner'

describe RequestCleaner do

  describe '#clean' do

    it 'marks requests older than 5 days as expired' do
      request = FactoryGirl.create(:open_request, created_at: 6.days.ago)

      RequestCleaner.clean

      request.reload
      request.state.should == 'expired'
    end

    it 'does not change requests newer than 5 days' do
      new_request = FactoryGirl.create(:open_request, created_at: 2.days.ago)
      old_request = FactoryGirl.create(:open_request, created_at: 6.days.ago)

      RequestCleaner.clean

      new_request.reload
      new_request.state.should == 'open'

      old_request.reload
      old_request.state.should == 'expired'
    end

    it 'does not change matched or completed requests' do
      completed_request = FactoryGirl.create(:completed_request, created_at: 6.days.ago)
      matched_request = FactoryGirl.create(:matched_request, created_at: 6.days.ago)

      RequestCleaner.clean

      completed_request.reload
      matched_request.reload

      completed_request.state.should == "complete"
      matched_request.state.should == "matched"

    end
  end

end
