require 'spec_helper'

module Refinery
  module Meetings
    describe Meeting do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:meeting,
          :meeting_title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:meeting_title) { should == "Refinery CMS" }
      end
    end
  end
end
