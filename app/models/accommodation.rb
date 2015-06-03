require 'httparty'

class Accommodation < ActiveRecord::Base
  belongs_to :trip

  def self.search(query)
    results = HTTParty.get("https://zilyo.p.mashape.com/search?latitude=52.5306438&longitude=13.3830683",
       headers:{
      "X-Mashape-Key" => "3ZTEQSj47hmshLld5Yz1YbKD3SH1p1kgoxLjsnwcFjdSsDPmPF",
      "Accept" => "application/json"
      })
      return JSON.parse(results)
  end
end
