class User < ActiveRecord::Base
  #sup
  has_many :links
  has_many :comments
end
