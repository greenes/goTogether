class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  validates :user, presence: true

end
