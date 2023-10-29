
class RandomUser
    class Location
        class Coordinates
            # @return [Float] the latitude
            attr_accessor :latitude
            # @return [Float] the longitude
            attr_accessor :longitude

            # Check if this Coordinates object is +==+ to another.
            #
            # @param other [Coordinates] the other object
            # @return [Boolean] +true+ or +false+
            def ==(other)
              return false unless other.is_a?(self.class)
              (self.latitude == other.latitude) && (self.longitude == other.longitude)
            end

            # Check if this Coordinates object is +eql+ to another.
            #
            # @param other [Coordinates] the other object
            # @return [Boolean] +true+ or +false+
            def eql?(other)
              (self == other)
            end

            # Check if this Coordinates object is valid.
            #
            # @return [Boolean] +true+ or +false+
            def valid?
              !(self.latitude.nil? || self.longitude.nil?)
            end

            # Create a new Coordinates object from parsed JSON data.
            #
            # @param json_data [Hash] parsed JSON data
            # @return [Coordinates] a new Coordinates object
            # @raise [StandardError] if the resulting object is not valid
            def self.from_json(json_data)
              c = Coordinates.new
              c.latitude = json_data['latitude'].to_f
              c.longitude = json_data['longitude'].to_f
              c.validate
              c
            end

            def validate
              throw StandardError.new unless self.valid?
            end
        end
    end
end
