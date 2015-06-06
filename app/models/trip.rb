class Trip < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :user

  validates :trip_name, :trip_location, :trip_dates, :user_id, presence: true

end
