require 'randomuserme/version'
require 'randomuser'
require "httparty"

module Randomuserme
  class Client
    include HTTParty
    
    api_base = 'http://api.randomuser.me'
    
    base_uri uri
    
    format :json
    
    def self.random
      response = get('/')
      return false if !response.parsed_response
      form_response(response)
    end
    
    def self.seeded(seed)
      response = get("/?seed=#{seed}")
      form_response(response)
    end
    
    private
    
    def self.form_response(response)
      return false if !response.parsed_response
      reply = Randomuser.new
      reply.gender = response.parsed_response['gender']
      reply.email = response.parsed_response['email']
      return reply
      end
    
  end
end
