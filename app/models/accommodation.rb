require 'httparty'

class Accommodation < ActiveRecord::Base
  belongs_to :trip

  def self.search(query)
    @query = query
    @lat = Geocoder.search(@query).first.data["geometry"]["location"]["lat"]
    @lng = Geocoder.search(@query).first.data["geometry"]["location"]["lng"]

    results = HTTParty.get("https://zilyo.p.mashape.com/search?latitude=#{@lat}8&longitude=#{@lng}",
       headers:{
      "X-Mashape-Key" => "3ZTEQSj47hmshLld5Yz1YbKD3SH1p1kgoxLjsnwcFjdSsDPmPF",
      "Accept" => "application/json"
      })
      return JSON.parse(results)
  end
end
