class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  validates :user, presence: true
  validates_uniqueness_of :user_id, :scope => [:trip_id]

end
