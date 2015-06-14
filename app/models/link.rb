class Link < ActiveRecord::Base
  validates :title, :destination, presence: true
  has_many :comments
  belongs_to :user
end
