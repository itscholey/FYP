
FactoryGirl.define do
  factory :meeting, :class => Refinery::Meetings::Meeting do
    sequence(:meeting_title) { |n| "refinery#{n}" }
  end
end

