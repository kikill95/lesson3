class User < ActiveRecord::Base
  has_secure_password

  validates :login, :email, presence: true
end
