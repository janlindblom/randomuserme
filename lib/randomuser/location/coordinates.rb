
class Randomuser
    class Location
        class Coordinates
            attr_accessor :latitude, :longitude

            def self.from_json(json_data)
              c = Coordinates.new
              c.latitude = json_data['latitude'].to_f
              c.longitude = json_data['longitude'].to_f
              c
            end
        end
    end
end
