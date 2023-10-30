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

      %w[street city state zip postcode coordinates timezone].each do |key|
        return false unless send(key.to_sym) == other.send(key.to_sym)
      end
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      %w[street city state zip postcode coordinates timezone].each do |key|
        return false if send(key.to_sym).nil?
      end
      coordinates.valid? && street.valid? && timezone.valid?
    end

    def validate
      throw StandardError.new unless valid?
    end

    def self.from_json(json_data)
      l = Location.new
      %w[city state postcode zip].each do |key|
        l.send "#{key}=", (key == 'zip') || (key == 'postcode') ? zip_value(json_data) : json_data[key]
      end
      l.street = Street.from_json(json_data['street'])
      l.coordinates = Coordinates.from_json(json_data['coordinates'])
      l.timezone = Timezone.from_json(json_data['timezone'])
      l.validate
      l
    end

    class << self
      private

      def zip_value(json_data)
        zip_key = json_data.key?('zip') ? 'zip' : 'postcode'
        json_data[zip_key]
      end
    end
  end
end
