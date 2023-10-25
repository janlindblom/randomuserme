require 'randomuser/location/coordinates'
require 'randomuser/location/street'
require 'randomuser/location/timezone'

class Randomuser
  class Location
    attr_accessor :street, :city, :state, :zip, :postcode
    attr_accessor :coordinates, :timezone

    def initialize
      self.coordinates = Coordinates.new
      self.street = Street.new
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      (self.street == other.street) && (self.city == other.city) && (self.zip == other.zip) && (self.postcode == other.postcode) && (self.coordinates == other.coordinates) && (self.timezone == other.timezone)
    end

    def eql?(other)
      (self == other)
    end

    def self.from_json(json_data)
      zip_key = 'zip'
      zip_key = 'postcode' unless json_data.has_key?('zip')
      l = Location.new
      l.street = Street.from_json(json_data['street'])
      l.city = json_data['city']
      l.state = json_data['state']
      l.zip = json_data[zip_key]
      l.postcode = json_data[zip_key]
      l.coordinates = Coordinates.from_json(json_data['coordinates'])
      l.timezone = Timezone.from_json(json_data['timezone'])
      l.validate
      l
    end

    def valid?
      true
    end

    def validate
      throw StandardError.new unless self.valid?
    end
  end
end
