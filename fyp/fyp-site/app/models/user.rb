class User < ActiveRecord::Base
  validates :username,  presence: true, length: { maximum: 10 }
  validates :email,     presence: true, length: { maximum: 254 }
  validates :name,      presence: true, length: { maximum: 50 }
  validates :password,  presence: true, length: { minimum: 8 }

  has_many :assignments
  has_many :roles, through: :assignments

  has_secure_password

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def role?(role)
  roles.any? { |r| r.name.underscore.to_sym == role }
end
end
