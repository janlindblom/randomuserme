require 'randomuserme/version'
require 'randomuser'
require "httparty"

module Randomuserme
  class Client
    include HTTParty

    base_uri 'api.randomuser.me'

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
      #reply = Randomuser.new
      response_user = response.parsed_response['results'].first

      #reply.gender = response_user['gender']
      #reply.email = response_user['email']

      #reply.name.title = response_user['name']['title']
      #reply.name.first = response_user['name']['first']
      #reply.name.last = response_user['name']['last']
      return Randomuser.from_json(response_user)
      end

  end
end
