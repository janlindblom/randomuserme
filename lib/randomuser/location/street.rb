class Randomuser
  class Location
      class Street
          attr_accessor :number, :name

          def self.from_json(json_data)
            s = Street.new
            s_num = json_data['number']
            # TODO: parse into number if possible
            s.number = s_num
            s.name = json_data['name']
            s
          end
      end
  end
end
