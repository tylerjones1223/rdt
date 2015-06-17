class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  validates :vote, inclusion: { in: [-1,1] }

end
