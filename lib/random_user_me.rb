# frozen_string_literal: true

require 'random_user_me/version'
require 'random_user'
# require 'uri'
# require 'net/http'
require 'httparty'
# require 'multi_json'

# The randomuser.me interface main module.
module RandomUserMe
  include HTTParty

  base_uri 'api.randomuser.me'

  format :json

  # Get a random user from randomuser.me
  #
  # @param seed [String, Numeric] an initial seed
  # @return [Randomuser] a random user object
  def self.random_user(seed = nil)
    if seed.nil?
      random
    else
      seeded(seed)
    end
  end

  def self.random
    response = get('/')
    return false if response.nil?
    return false unless response.parsed_response

    form_response(response)
  end

  def self.seeded(seed)
    response = get("/?seed=#{seed}")
    return false if response.nil?
    return false unless response.parsed_response

    form_response(response)
  end

  # def self.get(path)
  #  uri = URI('https://api.randomuser.me' + path)
  #  res = Net::HTTP.get_response(uri)
  #  return res.body if res.is_a?(Net::HTTPSuccess)
  #  return nil
  # end

  def self.form_response(response)
    response_user = response.parsed_response['results'].first

    RandomUser.from_json(response_user)
  end
end
