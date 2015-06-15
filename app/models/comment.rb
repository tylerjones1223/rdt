class Comment < ActiveRecord::Base
  validates :content, :user_id, :link_id, presence: true
  belongs_to :user
  belongs_to :link
end
