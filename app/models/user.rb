class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :password, blank?: false
  validates :username, uniqueness: { case_sensitive: false }
end
