
class Randomuser
    class Location
        class Timezone
            attr_accessor :offset, :description

            def self.from_json(json_data)
              c = Timezone.new
              c.offset = json_data['offset'].to_f
              c.description = json_data['description']
              c.validate
              c
            end

            def ==(other)
              return false unless other.is_a?(self.class)
              (self.offset == other.offset) && (self.description == other.description)
            end

            def eql?(other)
              (self == other)
            end

            def valid?
              !(self.offset.nil? || self.description.nil?)
            end

            def validate
              throw StandardError.new unless self.valid?
            end
        end
    end
end
