require 'httparty'

class Accommodation < ActiveRecord::Base
  belongs_to :trip

  def self.search (query)
    @search = HTTParty.get
  end
end
