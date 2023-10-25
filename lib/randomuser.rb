require 'randomuser/name'
require 'randomuser/location'
require 'randomuser/picture'
require 'randomuser/login'
require 'date'

class Randomuser
  attr_accessor :gender, :name, :location, :email, :login, :phone, :cell, :picture
  attr_accessor :dob, :registered, :id, :nat

  def initialize
    self.name = Randomuser::Name.new
    self.location = Randomuser::Location.new
  end

  def ==(other)
    return false unless (self.gender == other.gender) && (self.email == other.email) && (self.phone == other.phone) && (self.cell == other.cell) && (self.nat == other.nat)
    return false unless (self.name == other.name)
    return false unless (self.location == other.location)
    return false unless (self.login == other.login)
    #return false unless (self.picture == other.picture)
    #return false unless (self.dob == other.dob)
    #return false unless (self.registered == other.registered)
    #return false unless (self.id == other.id)
    true
  end

  def eql?(other)
    (self == other)
  end

  def self.from_json(json_data)
    u = Randomuser.new
    u.gender = json_data['gender']
    u.name = Randomuser::Name.from_json(json_data['name'])
    u.location = Randomuser::Location.from_json(json_data['location'])
    u.email = json_data['email']
    u.login = Randomuser::Login.from_json(json_data['login'])
    u.phone = json_data['phone']
    u.cell = json_data['cell']
    u.dob = DateTime.parse(json_data['dob']['date'])
    u.registered = DateTime.parse(json_data['registered']['date'])
    u.id = json_data['id']
    u.nat = json_data['nat']
    u.picture = Randomuser::Picture.from_json(json_data['picture'])
    u
  end
end
