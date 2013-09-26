require 'randomuser/name'
require 'randomuser/location'

module Randomuser
  class << self
    attr_accessor :gender, :name, :location, :email, :password, :phone, :cell, :ssn, :picture, :seed
    
    def new
    end
    
    def valid?
      
    end
  end
end