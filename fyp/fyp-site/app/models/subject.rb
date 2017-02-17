class Subject < ActiveRecord::Base
  belongs_to :user #teacher
  has_many :lessons
end
