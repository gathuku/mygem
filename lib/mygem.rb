require "mygem/version"
require 'net/http'
require 'uri'
require "json"



module Mygem
  class Error < StandardError; end
  # Your code goes here...

  def self.jsonip
    uri = URI("https://jsonip.org/")
    response= Net::HTTP.get(uri)
   JSON.parse(response)["ip"]
  end

end
