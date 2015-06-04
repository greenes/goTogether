class Note < ActiveRecord::Base
  belongs_to :trip

  validates :body, presence: true

end
