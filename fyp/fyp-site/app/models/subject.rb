class Subject < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 },
                    case_sensitive: false
  validates :teacher_id, presence: true
  validates :classGroup, presence: true         
  belongs_to :user #teacher
  has_many :lessons
end
