class Randomuser
  class Location
      class Street
          attr_accessor :number, :name

          def self.from_json(json_data)
            s = Street.new
            s.number = json_data['number']
            s.name = json_data['name']
            s.validate
            s
          end

          def ==(other)
            return false unless other.is_a?(self.class)
            (self.number == other.number) && (self.name == other.name)
          end

          def eql?(other)
            (self == other)
          end

          def valid?
            !(self.number.nil? || self.name.nil?)
          end

          def validate
            throw StandardError.new unless self.valid?
          end
      end
  end
end
