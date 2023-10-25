
class Randomuser
    class Location
        class Coordinates
            attr_accessor :latitude, :longitude

            def ==(other)
              return false unless other.is_a?(self.class)
              (self.latitude == other.latitude) && (self.longitude == other.longitude)
            end

            def eql?(other)
              (self == other)
            end

            def valid?
              !(self.latitude.nil? || self.longitude.nil?)
            end

            def validate
              throw StandardError.new unless self.valid?
            end

            def self.from_json(json_data)
              c = Coordinates.new
              c.latitude = json_data['latitude'].to_f
              c.longitude = json_data['longitude'].to_f
              c.validate
              c
            end
        end
    end
end
