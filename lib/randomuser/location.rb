require 'randomuser/location/coordinates'

class Randomuser
  class Location
    attr_accessor :street, :city, :state, :zip
    attr_accessor :coordinates, :timezone

    def initialize
      self.coordinates = Randomuser::Location::Coordinates.new
    end
  end
end