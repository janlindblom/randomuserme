require 'randomuser/name'
require 'randomuser/location'

class Randomuser
  attr_accessor :gender, :name, :location, :email, :password, :phone, :cell, :ssn, :picture, :seed
  
  def initialize
    self.name = Randomuser::Name.new
    self.location = Randomuser::Location.new
  end
end