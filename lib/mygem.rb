require "mygem/version"
require 'net/http'
require 'uri'
require "json"
require "faraday"



module Mygem

  class Error < StandardError; end
  # Your code goes here...
  class << self
  attr_accessor :configuration
    def configure
    self.configuration ||= Configuration.new
    yield(configuration)
    end

  def reset
    self.configuration = Configuration.new
  end

  end

  def self.jsonip
    uri = URI("https://jsonip.org/")
    response= Net::HTTP.get(uri)
   JSON.parse(response)["ip"]
  end

  def self.create_post

   url="https://jsonplaceholder.typicode.com/posts"
   body={
    title: 'Build and api gem',
    body: 'some body',
    userId: 1
   }
   headers={
     "Content-Type":"application/json; charset=UTF-8"
   }
  Faraday.post(url,body.to_json,headers)

  #JSON.parse(res.body)
  end

end

class Configuration
  attr_accessor :access_token

  def initialize
    @access_token = nil
  end
end
