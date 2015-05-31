class Trip < ActiveRecord::Base
  has_many :members
  has_many :notes
  has_many :activities
  has_many :accommodations
  has_and_belongs_to_many :users


end
