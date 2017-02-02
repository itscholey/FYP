class User < ActiveRecord::Base
  validates :username,  presence: true, length: { maximum: 10 }
  validates :email,     presence: true, length: { maximum: 254 }
  validates :name,      presence: true, length: { maximum: 50 }
end
