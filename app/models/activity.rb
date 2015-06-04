require 'httparty'
require 'yelp'

class Activity < ActiveRecord::Base
  belongs_to :trip


  def self.search(query)

    client = Yelp::Client.new({ consumer_key: "AiqRMvIEeGwhtjfwENo8TA",
                                consumer_secret: "kgXETyDOaxmmdHjTTzApHWzjzdo",
                                token: "57p5yEmr0LR0KTEwDIiGyJ6YCY1UHs_F",
                                token_secret: "I5SgufL-Qnt8V-S1g52RUkivREo"
                              })

    return client.search(query)
  end


end
