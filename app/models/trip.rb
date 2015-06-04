class Trip < ActiveRecord::Base
  has_many :members
  has_many :notes
  has_many :activities
  has_many :accommodations
  has_many :users, through: :memberships
  belongs_to :user

  validates :trip_name, :trip_location, :trip_dates, :user_id, presence: true

end
