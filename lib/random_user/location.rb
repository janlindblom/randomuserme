# frozen_string_literal: true

require 'random_user/location/coordinates'
require 'random_user/location/street'
require 'random_user/location/timezone'

class RandomUser
  class Location
    attr_accessor :street, :city, :state, :zip, :postcode, :coordinates, :timezone

    def initialize
      self.coordinates = Coordinates.new
      self.street = Street.new
      self.timezone = Timezone.new
    end

    def ==(other)
      return false unless other.is_a?(self.class)

      (street == other.street) && (city == other.city) && (zip == other.zip) && (postcode == other.postcode) && (coordinates == other.coordinates) && (timezone == other.timezone)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(street.nil? || city.nil? || state.nil? || zip.nil? || postcode.nil? || coordinates.nil? || timezone.nil?) && coordinates.valid? && street.valid? && timezone.valid?
    end

    def validate
      throw StandardError.new unless valid?
    end

    def self.from_json(json_data)
      zip_key = 'zip'
      zip_key = 'postcode' unless json_data.key?('zip')
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
  end
end
