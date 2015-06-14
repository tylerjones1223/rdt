class User < ActiveRecord::Base
  #sup
  validates :email, :password, presence: true
  has_many :links
  has_many :comments
end
