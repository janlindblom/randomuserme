# frozen_string_literal: true

class RandomUser
  class Location
    class Timezone
      attr_accessor :offset, :description

      def ==(other)
        return false unless other.is_a?(self.class)

        (offset == other.offset) && (description == other.description)
      end

      def eql?(other)
        (self == other)
      end

      def valid?
        !(offset.nil? || description.nil?)
      end

      def validate
        throw StandardError.new unless valid?
      end

      def self.from_json(json_data)
        c = Timezone.new
        c.offset = json_data['offset'].to_f
        c.description = json_data['description']
        c.validate
        c
      end
    end
  end
end
