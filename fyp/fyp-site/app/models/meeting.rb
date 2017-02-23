class Meeting < ActiveRecord::Base
  has_many: :attendees
  has_many: :users, through: :attendees
end
