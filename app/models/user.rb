class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :trips, through: :memberships
  has_many :created_trips, class_name: "Trip", source: :owner

  def joined_trips
    self.trips.where(:pending, false)
  end

  def invited_trips
    self.trips.where(:pending, true)
  end
  
end
