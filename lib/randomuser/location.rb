require 'randomuser/location/coordinates'
require 'randomuser/location/street'

class Randomuser
  class Location
    attr_accessor :street, :city, :state, :zip, :postcode
    attr_accessor :coordinates, :timezone

    def initialize
      self.coordinates = Randomuser::Location::Coordinates.new
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
      #l.timezone = Timezone.from_json(json_data['timezone'])
      l
    end
  end
end
