require 'httparty'

class Accommodation < ActiveRecord::Base
  belongs_to :trip

  def self.search (query)
    @search = HTTParty.get("https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=22.37&nelongitude=-154.48000000000002&provider=airbnb%2Chousetrip&swlatitude=18.55&swlongitude=-160.52999999999997",
       headers:{
      "X-Mashape-Key" => "3ZTEQSj47hmshLld5Yz1YbKD3SH1p1kgoxLjsnwcFjdSsDPmPF",
      "Accept" => "application/json"
      })
  end
end
