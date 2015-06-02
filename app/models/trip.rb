class Trip < ActiveRecord::Base
  has_many :members
  has_many :notes
  has_many :activities
  has_many :accommodations
  has_many :users, through: :memberships
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

end
