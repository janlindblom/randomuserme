# frozen_string_literal: true

require 'random_user/name'
require 'random_user/location'
require 'random_user/picture'
require 'random_user/login'
require 'date'

# A random user object
class RandomUser
  attr_accessor :gender, :name, :location, :email, :login, :phone, :cell, :picture, :dob, :registered, :id, :nat

  def initialize
    self.name = RandomUser::Name.new
    self.location = RandomUser::Location.new
  end

  # Compare this RandomUser to another RandomUser object.
  #
  # @param other [RandomUser] the other object
  # @return true or false
  def ==(other)
    return false unless other.is_a?(self.class)
    unless (gender == other.gender) && (email == other.email) && (phone == other.phone) && (cell == other.cell) &&
           (nat == other.nat)
      return false
    end
    return false unless name == other.name
    return false unless location == other.location
    return false unless login == other.login
    return false unless picture == other.picture

    # return false unless (self.dob == other.dob)
    # return false unless (self.registered == other.registered)
    # return false unless (self.id == other.id)
    true
  end

  def eql?(other)
    (self == other)
  end

  # Create a RandomUser object from JSON data returned from the randomuser.me
  #   API.
  #
  # @param json_data [Hash] parsed JSON data
  # @return [RandomUser] a RandomUser object
  def self.from_json(json_data)
    u = RandomUser.new
    u.gender = json_data['gender']
    u.name = RandomUser::Name.from_json(json_data['name'])
    u.location = RandomUser::Location.from_json(json_data['location'])
    u.email = json_data['email']
    u.login = RandomUser::Login.from_json(json_data['login'])
    u.phone = json_data['phone']
    u.cell = json_data['cell']
    u.dob = DateTime.parse(json_data['dob']['date'])
    u.registered = DateTime.parse(json_data['registered']['date'])
    u.id = json_data['id']
    u.nat = json_data['nat']
    u.picture = RandomUser::Picture.from_json(json_data['picture'])
    u
  end
end
